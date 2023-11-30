import { Component } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { Observable } from 'rxjs';
import { Student } from 'src/app/interfaces/student';
import { AddStudentComponent } from 'src/app/modals/add-student/add-student.component';
import { StudentService } from 'src/app/services/student/student.service';

@Component({
  selector: 'app-students',
  templateUrl: './students.component.html',
  styleUrls: ['./students.component.scss']
})
export class StudentsComponent {

  public _students: Student[] = []

  constructor(private studentService: StudentService, private dialog: MatDialog) { }

  ngOnInit(): void {
    this.refresh()
  }

  refresh() {
    this.studentService.getAll().then((data: any) => {
      this._students = data
    })
  }

  addStudent() {
    const dialogRef = this.dialog.open(AddStudentComponent,
      { autoFocus: false }
    )
    dialogRef.afterClosed().subscribe((result: any) => {
      if (result) {
        this.refresh()
      }
    })
  }

  deleteStudent(id: number) {
    if (confirm('Esta acción no es reversible, desea continuar?')) {
      this.studentService.delete(id).then(result => {
        if (result) {
          this.refresh()
        }
      })
    }
  }
}
