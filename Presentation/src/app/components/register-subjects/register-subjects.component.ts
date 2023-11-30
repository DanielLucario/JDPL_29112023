import { Component } from '@angular/core';
import { ActivatedRoute, Route } from '@angular/router';
import { Student } from 'src/app/interfaces/student';
import { Subject } from 'src/app/interfaces/subject';
import { StudentService } from 'src/app/services/student/student.service';
import { SubjectService } from 'src/app/services/subject/subject.service';

@Component({
  selector: 'app-register-subjects',
  templateUrl: './register-subjects.component.html',
  styleUrls: ['./register-subjects.component.scss']
})
export class RegisterSubjectsComponent {

  public _student: Student = {
    nombre: '',
    apellidoMaterno: '',
    apellidoPaterno: ''
  }
  public _id: number = 0
  public _total: number = NaN
  public _subjects: Subject[] = []
  public _registered: Subject[] = []
  public _idMateria: number = 0
  constructor(
    private studentService: StudentService,
    private subjectService: SubjectService,
    private route: ActivatedRoute
  ) {
    this._id = this.route.snapshot.params['id']
  }

  ngOnInit(): void {
    this.refreshStudent()
    this.refreshSubjects()
    this.refreshStudentSubjects()
    this.refreshStudentCost()
  }

  refreshSubjects() {
    this.subjectService.getAll().then((data: any) => {
      this._subjects = data
    })
  }
  refreshStudent() {
    this.studentService.getOne(this._id).then((data: any) => {
      this._student = data
    })
  }
  refreshStudentSubjects() {
    this.studentService.getMaterias(this._id).then((data: any) => {
      console.log(data);

      this._registered = data
    })
  }
  refreshStudentCost() {
    this.studentService.getCosto(this._id).then((data: any) => {
      this._total = data.result
    })
  }

  public registerSubject() {
    if (this._idMateria > 0) {
      this.studentService.registerSubject(this._id, this._idMateria).then((data: any) => {
        console.log(data);
        if (data.result) {
          this.refreshStudentCost()
          this.refreshStudentSubjects()
        }
      })
    }
    this._idMateria = 0
  }
}
