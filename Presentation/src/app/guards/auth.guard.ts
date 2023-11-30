import { CanActivateFn, Router } from '@angular/router';

export const authGuard: CanActivateFn = (route, state) => {
  if (localStorage.getItem('isLogged')) {
    return true
  }
  window.location.href = '/';
  return false
};
