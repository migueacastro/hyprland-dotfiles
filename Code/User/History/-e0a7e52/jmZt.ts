import { writable } from "svelte/store";
import type { Writable } from "svelte/store";

interface User {
    id: Number | null;
    email: String | null;
    name: String | null;
    is_staff: Boolean | null;
    is_superuser: Boolean | null;
}

export const userStore: any = writable({name: null, email: null, id:null, is_staff: null, is_superuser: null})