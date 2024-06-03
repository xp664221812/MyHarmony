export class Song {
    id: number;
    album_id: number;
    name: string;
    duration: number;
    cover: string;
    lang: string;
    listen_end: number;
    performer: string;
    mp3_wav: string;
    style: string;
    img: string;
    src: string;
    album: Album;
}

export class Album {
    id: number;
    name: string;
    alias_name: string;
    sub_name: string;
    product_code: number;
    editor_code: number;
    bar_code: string;
    performer: string;
    version: string;
    link: string;
    main_version: number;
    album_desc: string;
    intro: string;
    issue_time: string;
    issue_state: number;
    issue_company: number;
    issue_area: number;
    copyright: number;
    money: any;
    graphy: string;
    style: string;
    lang: string;
    is_hot: number;
    sort_hot: number;
    audit: number;
    disc_count: number;
    cover: string;
    tag: string;
    created_at: string;
    updated_at: string;
    deleted_at: any;
}