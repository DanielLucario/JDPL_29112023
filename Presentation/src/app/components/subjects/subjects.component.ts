import { Component } from '@angular/core';
import { Subject } from 'src/app/interfaces/subject';
import { SubjectService } from 'src/app/services/subject/subject.service';
import { environment } from 'src/environments/environments';

@Component({
  selector: 'app-subjects',
  templateUrl: './subjects.component.html',
  styleUrls: ['./subjects.component.scss']
})
export class SubjectsComponent {
  public _subjects: Subject[] = []
  public nombre: string = '';
  public costo: number = 0;

  constructor(private subjectService: SubjectService) { }

  ngOnInit(): void {
    this.refresh();
  }

  private refresh() {
    this.subjectService.getAll().then((data: any) => {
      this._subjects = data
    })
  }
  public addSubjects() {
    const subject: Subject = {
      nombre: this.nombre.trim().replaceAll(environment.charsToDelete, ''),
      costo: this.costo
    }
    if (subject.nombre == null || subject.nombre == '') {
      alert("Ingrese un nombre valido");
      return;
    }
    this.subjectService.insert(subject).then((result => {
      console.log(result);
      if (result) {
        this.refresh()
        this.nombre = '';
        this.costo = 0;
      }
    }))
  }
  public deleteSubject(id: number) {
    if (confirm('Esta acción no es reversible, desea continuar?')) {
      this.subjectService.delete(id).then(() => { this.refresh() })
    }
  }
}
