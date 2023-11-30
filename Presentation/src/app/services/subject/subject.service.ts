import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Subject } from 'src/app/interfaces/subject';
import { environment } from 'src/environments/environments';

@Injectable({
  providedIn: 'root'
})
export class SubjectService {

  constructor(private http: HttpClient) { }

  public async getAll(): Promise<Subject> {
    return new Promise((resolve) => {
      this.http.get<Subject>(environment.host + '/Materias').subscribe(result => {
        resolve(result)
      })
    })
  }
  public async insert(subject: Subject) {
    return new Promise((resolve) => {
      this.http.post(environment.host + '/Materias', subject).subscribe(result => {
        resolve(result)
      })
    })
  }
  public async delete(id: number) {
    return new Promise((resolve) => {
      this.http.delete(`${environment.host}/Materias/${id}`).subscribe(result => {
        resolve(true)
      })
    })
  }
}
