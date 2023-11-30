import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Student } from 'src/app/interfaces/student';
import { environment } from 'src/environments/environments';
import { Observable } from 'rxjs';
import { Subject } from 'src/app/interfaces/subject';

@Injectable({
  providedIn: 'root'
})
export class StudentService {

  constructor(private http: HttpClient) { }

  public async getAll(): Promise<Student> {
    return new Promise((resolve) => {
      this.http.get<Student>(environment.host + '/Alumnos').subscribe(result => {
        resolve(result)
      })
    })
  }
  public async getOne(id: number): Promise<Student> {
    return new Promise((resolve) => {
      this.http.get<Student>(environment.host + '/Alumnos/' + id).subscribe(result => {
        resolve(result)
      })
    })
  }
  public async insert(student: Student) {
    return new Promise((resolve) => {
      this.http.post(environment.host + '/Alumnos', student).subscribe(result => {
        resolve(result)
      })
    })
  }
  public async delete(id: number) {
    return new Promise((resolve) => {
      this.http.delete(`${environment.host}/Alumnos/${id}`).subscribe(result => {
        resolve(true)
      })
    })
  }
  public async getMaterias(id: number): Promise<Subject> {
    return new Promise((resolve) => {
      this.http.get<Subject>(environment.host + '/Alumnos/materias/' + id).subscribe(result => {
        resolve(result)
      })
    })
  }
  public async getCosto(id: number) {
    return new Promise((resolve) => {
      this.http.get(environment.host + '/Alumnos/costo/' + id).subscribe(result => {
        resolve(result)
      })
    })
  }
  public async registerSubject(idAlumno: number, idMateria: number) {
    const payload = {
      idAlumno, idMateria
    }
    return new Promise((resolve) => {
      this.http.post(environment.host + '/Alumnos/registrarMateria', payload).subscribe(result => {
        resolve(result)
      })
    })
  }
}
