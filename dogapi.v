/*
 * Copyright 2022 XXIV
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
module dogapi

import net.http
import x.json2

fn get_request(endpoint string) ?string {
	response := http.get("https://dog.ceo/api/${endpoint}") or {
		return err
	}
	return response.text
}

// random_image DISPLAY SINGLE RANDOM IMAGE FROM ALL DOGS COLLECTION
//
// Returns a random dog image
pub fn random_image() ?string {
	response := get_request("breeds/image/random") or {
		return error(err.str())
	}
	json := json2.raw_decode(response) or {
		return error("Something went wrong while reading json: ${err}")
	}
	data := json.as_map()
	status := data["status"] or {
		return error("Something went wrong while reading json")
	}
	message := data["message"] or {
		return error("Something went wrong while reading json")
	}
	if status.str() != "success" {
		return error(message.str())
	}
	return message.str()
}

// multiple_random_images DISPLAY MULTIPLE RANDOM IMAGES FROM ALL DOGS COLLECTION
//
// * `images_number` number of images
//
// *NOTE* ~ Max number returned is 50
//
// Return multiple random dog image
pub fn multiple_random_images(images_number int) ?[]string {
	response := get_request("breeds/image/random/${images_number}") or {
		return error(err.str())
	}
	json := json2.raw_decode(response) or {
		return error("Something went wrong while reading json: ${err}")
	}
	data := json.as_map()
	status := data["status"] or {
		return error("Something went wrong while reading json")
	}
	message := data["message"] or {
		return error("Something went wrong while reading json")
	}
	if status.str() != "success" {
		return error(message.str())
	}

	mut slice := []string{}
	for i in message.arr() {
		slice << i.str()
	}
	return slice
}

// random_image_by_breed RANDOM IMAGE FROM A BREED COLLECTION
//
// * `breed` breed name
//
// Returns a random dog image from a breed, e.g. hound
pub fn random_image_by_breed(breed string) ?string {
	response := get_request("breed/${breed}/images/random") or {
		return error(err.str())
	}
	json := json2.raw_decode(response) or {
		return error("Something went wrong while reading json: ${err}")
	}
	data := json.as_map()
	status := data["status"] or {
		return error("Something went wrong while reading json")
	}
	message := data["message"] or {
		return error("Something went wrong while reading json")
	}
	if status.str() != "success" {
		return error(message.str())
	}
	return message.str()
}

// multiple_random_images_by_breed MULTIPLE IMAGES FROM A BREED COLLECTION
//
// * `breed` breed name
// * `images_number` number of images
//
// Return multiple random dog image from a breed, e.g. hound
pub fn multiple_random_images_by_breed(breed string, images_number int) ?[]string {
	response := get_request("breed/${breed}/images/random/${images_number}") or {
		return error(err.str())
	}
	json := json2.raw_decode(response) or {
		return error("Something went wrong while reading json: ${err}")
	}
	data := json.as_map()
	status := data["status"] or {
		return error("Something went wrong while reading json")
	}
	message := data["message"] or {
		return error("Something went wrong while reading json")
	}
	if status.str() != "success" {
		return error(message.str())
	}

	mut slice := []string{}
	for i in message.arr() {
		slice << i.str()
	}
	return slice
}

// images_by_breed ALL IMAGES FROM A BREED COLLECTION
//
// * `breed` breed name
//
// Returns an array of all the images from a breed, e.g. hound
pub fn images_by_breed(breed string) ?[]string {
	response := get_request("breed/${breed}/images") or {
		return error(err.str())
	}
	json := json2.raw_decode(response) or {
		return error("Something went wrong while reading json: ${err}")
	}
	data := json.as_map()
	status := data["status"] or {
		return error("Something went wrong while reading json")
	}
	message := data["message"] or {
		return error("Something went wrong while reading json")
	}
	if status.str() != "success" {
		return error(message.str())
	}

	mut slice := []string{}
	for i in message.arr() {
		slice << i.str()
	}
	return slice
}

// random_image_by_sub_breed SINGLE RANDOM IMAGE FROM A SUB BREED COLLECTION
//
// * `breed` breed name
// * `sub_breed` sub_breed name
//
// Returns a random dog image from a sub-breed, e.g. Afghan Hound
pub fn random_image_by_sub_breed(breed string, sub_breed string) ?string {
	response := get_request("breed/${breed}/${sub_breed}/images/random") or {
		return error(err.str())
	}
	json := json2.raw_decode(response) or {
		return error("Something went wrong while reading json: ${err}")
	}
	data := json.as_map()
	status := data["status"] or {
		return error("Something went wrong while reading json")
	}
	message := data["message"] or {
		return error("Something went wrong while reading json")
	}
	if status.str() != "success" {
		return error(message.str())
	}
	return message.str()
}

// multiple_random_images_by_sub_breed MULTIPLE IMAGES FROM A SUB-BREED COLLECTION
//
// * `breed` breed name
// * `sub_breed` sub_breed name
// * `images_number` number of images
//
// Return multiple random dog images from a sub-breed, e.g. Afghan Hound
pub fn multiple_random_images_by_sub_breed(breed string, sub_breed string, images_number int) ?[]string {
	response := get_request("breed/${breed}/${sub_breed}/images/random/${images_number}") or {
		return error(err.str())
	}
	json := json2.raw_decode(response) or {
		return error("Something went wrong while reading json: ${err}")
	}
	data := json.as_map()
	status := data["status"] or {
		return error("Something went wrong while reading json")
	}
	message := data["message"] or {
		return error("Something went wrong while reading json")
	}
	if status.str() != "success" {
		return error(message.str())
	}

	mut slice := []string{}
	for i in message.arr() {
		slice << i.str()
	}
	return slice
}

// images_by_sub_breed LIST ALL SUB-BREED IMAGES
//
// * `breed` breed name
// * `sub_breed` sub_breed name
//
// Returns an array of all the images from the sub-breed
pub fn images_by_sub_breed(breed string, sub_breed string) ?[]string {
	response := get_request("breed/${breed}/${sub_breed}/images") or {
		return error(err.str())
	}
	json := json2.raw_decode(response) or {
		return error("Something went wrong while reading json: ${err}")
	}
	data := json.as_map()
	status := data["status"] or {
		return error("Something went wrong while reading json")
	}
	message := data["message"] or {
		return error("Something went wrong while reading json")
	}
	if status.str() != "success" {
		return error(message.str())
	}

	mut slice := []string{}
	for i in message.arr() {
		slice << i.str()
	}
	return slice
}

// breeds_list LIST ALL BREEDS
//
// Returns map of all the breeds as keys and sub-breeds as values if it has
pub fn breeds_list() ?map[string][]string {
	response := get_request("breeds/list/all") or {
		return error(err.str())
	}
	json := json2.raw_decode(response) or {
		return error("Something went wrong while reading json: ${err}")
	}
	data := json.as_map()
	status := data["status"] or {
		return error("Something went wrong while reading json")
	}
	message := data["message"] or {
		return error("Something went wrong while reading json")
	}
	if status.str() != "success" {
		return error(message.str())
	}

	mut slice := map[string][]string{}
	for k,v in message.as_map() {
		mut val_slice := []string{}
		for i in v.arr() {
			val_slice << i.str()
		}
		slice[k] = val_slice
	}
	return slice
}

// sub_breeds_list LIST ALL SUB-BREEDS
//
// * `breed` breed name
//
// Returns an array of all the sub-breeds from a breed if it has sub-breeds
pub fn sub_breeds_list(breed string) ?[]string {
	response := get_request("breed/${breed}/list") or {
		return error(err.str())
	}
	json := json2.raw_decode(response) or {
		return error("Something went wrong while reading json: ${err}")
	}
	data := json.as_map()
	status := data["status"] or {
		return error("Something went wrong while reading json")
	}
	message := data["message"] or {
		return error("Something went wrong while reading json")
	}
	if status.str() != "success" {
		return error(message.str())
	}

	mut slice := []string{}
	for i in message.arr() {
		slice << i.str()
	}
	if slice.len == 0 {
		return error("the breed does not have sub-breeds")
	}
	return slice
}