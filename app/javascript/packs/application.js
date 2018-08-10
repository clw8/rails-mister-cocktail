/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import 'bootstrap';

const ingredDesc = document.querySelector('#amount');
const ingredDescHidden = document.querySelector('#dose_description');
const add_ing_button = document.querySelector('#cocktail_ingredients_container input[type=submit]');
const ingredContainerList= document.querySelector('#ingredient_list_for_new_c');

const ingSelect = document.querySelector('#cocktail_ingredients');
const ingSelectHidden = document.querySelector('#dose_ingredient_id');

if(add_ing_button){
  add_ing_button.addEventListener('click', (e) => {
    e.preventDefault();
    let li = document.createElement("li");
    li.appendChild(document.createTextNode(`${ingSelect.options[ingSelect.selectedIndex].innerHTML} - ${ingredDesc.value}`));
    ingredContainerList.appendChild(li);
    ingredDescHidden.value += ingredDesc.value + "$%";
    ingSelectHidden.value += ingSelect.options[ingSelect.selectedIndex].value + ",";
  })
}


const openButton = document.querySelectorAll('.dropdown-open-button');
const closeButton = document.querySelectorAll('.dropdown-close-button');
const formDropdownC = document.querySelector('.form-dropdown-container');

if(formDropdownC){
  openButton.forEach(btn =>{
    btn.addEventListener('click', (e) => {
      let formDropdownContainer = e.currentTarget.parentNode.parentNode
      formDropdownContainer.querySelector('.form-dropdown').classList.add('form-dropdown-open');
    })
  }
)

  closeButton.forEach( btn => {
    btn.addEventListener('click', (e) => {
      let formDropdown = e.currentTarget.parentNode.parentNode
      formDropdown.classList.remove('form-dropdown-open');
    })
  })
}
