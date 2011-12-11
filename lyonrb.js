function fetch_and_load_members() {
  var end_point = 'https://api.github.com/orgs/lyonrb/members?callback=?'
  $.getJSON(end_point, function(json) { load_members(json.data); });
}

function load_members(members) {
  $.each(members, function(i, member) { load_member(member.login) });
}

function load_member(member_login) {
  create_member_html(member_login);
  fetch_and_load_member_info(member_login);
  fetch_and_load_member_projects(member_login);
  increment_member_counter();
}

function create_member_html(member_login) {
  $("#members").append($("#template").clone().attr("id", member_login));
}

function fetch_and_load_member_info(member_login) {
  var end_point = 'https://api.github.com/users/' + member_login + '?callback=?'
  $.getJSON(end_point, function(json) { load_member_info(json.data); });
}

function load_member_info(member) {
  $("#" + member.login).find(".member-name").append(member.name);
  $("#" + member.login).find(".member-login").find("a").attr("href", member.html_url).
    append(member.login);
  $("#" + member.login).find(".member-bio").append(member.bio);
  $("#" + member.login).find(".member-email").append(member.email);
  $("#" + member.login).find(".member-company").append(member.company);
  $("#" + member.login).find(".member-blog").find("a").attr("href", member.blog).append(member.blog);
  $("#" + member.login).find(".member-avatar").find("img").attr("src", member.avatar_url);
}

function fetch_and_load_member_projects(member_login) {
  var end_point = 'https://api.github.com/users/' + member_login + '/repos?callback=?'
  $.getJSON(end_point, function(json) { load_member_projects(member_login, json.data); });
}

function load_member_projects(member_login, projects) {
  $.each(projects, function(i, project) {
    $("#" + member_login).find(".member-projects").find("ul").
    append($("<li><a href=" + project.html_url + ">" + project.name + "</a>"));
    increment_projects_counter();
  });
}

var nb_members = 0;
var nb_projects = 0;

function increment_member_counter() {
  nb_members += 1;
  $("#members_count").text(nb_members);
}

function increment_projects_counter() {
  nb_projects += 1;
  $("#projects_count").text(nb_projects);
}


$(document).ready(function(){
  fetch_and_load_members();
});
