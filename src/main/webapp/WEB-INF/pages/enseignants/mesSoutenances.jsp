<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Mes soutenances - Enseignant</title>
<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
</head>
<body class="bg-[#F7F8F5]">
<div class="flex min-h-screen">
  <aside class="w-64 bg-[#1D2E22] text-[#DDE4D6] flex flex-col px-5 py-6 shrink-0">
    <div class="flex items-center gap-2 font-medium text-lg text-white mb-8">
      <span class="w-9 h-9 rounded-lg bg-[#E7EFC9] flex items-center justify-center"><svg class="w-5 h-5 text-[#1D2E22]" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.8"><path d="M22 9 12 4 2 9l10 5 10-5Z"/><path d="M6 11v5c0 1.7 2.7 3 6 3s6-1.3 6-3v-5"/></svg></span>
      soutena.
    </div>
    <div class="flex items-center gap-3 pb-6 border-b border-[#2A3F31]">
      <span class="w-9 h-9 rounded-lg border border-[#3A5240] flex items-center justify-center"><svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5"><circle cx="8" cy="8" r="3"/><circle cx="17" cy="9" r="2.5"/><path d="M2 20c0-3 2.5-5 6-5s6 2 6 5M14 15.5c2.8.3 4.5 2 4.5 4.5"/></svg></span>
      <div><p class="text-sm text-white font-medium">Espace enseignant</p><p class="text-xs text-[#9FB89C]">Année académique 2024-2025</p></div>
    </div>
    <p class="text-xs tracking-widest uppercase text-[#7E9078] mt-6 mb-3">Mon espace personnel</p>
    <nav class="flex flex-col gap-1 text-sm">
      <a href="${pageContext.request.contextPath}/Encadrer?page=tableauDeBord" class="px-3 py-2.5 rounded-lg hover:bg-[#2A3F31]">Tableau de bord</a>
      <a href="${pageContext.request.contextPath}/Encadrer?page=mesSoutenances" class="px-3 py-2.5 rounded-lg bg-[#2F5B45] text-white">Mes soutenances</a>
      <a href="${pageContext.request.contextPath}/Encadrer?page=mesEvaluations" class="px-3 py-2.5 rounded-lg hover:bg-[#2A3F31]">Mes évaluations</a>
    </nav>
    <div class="mt-auto rounded-xl border border-[#3A5240] p-4 bg-[#24382B]">
      <p class="text-xs tracking-widest uppercase text-[#9FB89C] mb-2">Session de juin 2025</p>
      <p class="text-white font-medium mb-1">Faites grandir les talents.</p>
      <p class="text-xs text-[#B9C2AF] mb-3">Chaque regard compte dans le parcours d'un étudiant.</p>
      <p class="text-xs text-[#D8E4A6] flex items-center gap-1.5"><span class="w-1.5 h-1.5 rounded-full bg-[#D8E4A6]"></span>Ensemble, vers la réussite</p>
    </div>
    <nav class="flex flex-col gap-1 text-sm mt-4">
      <a href="#" class="px-3 py-2.5 rounded-lg hover:bg-[#2A3F31]">Aide &amp; contact</a>
      <a href="${pageContext.request.contextPath}/logout" class="px-3 py-2.5 rounded-lg hover:bg-[#2A3F31]">Se déconnecter</a>
    </nav>
  </aside>
  <main class="flex-1">
    <div class="flex items-center justify-between px-8 py-4 bg-white border-b border-[#E9EAE2]">
      <p class="text-sm text-[#6E6D5F]">Espace enseignant <span class="mx-2">›</span> <span class="text-[#2F3A2F]">Mes soutenances</span></p>
      <span class="w-9 h-9 rounded-full bg-[#E7EFDF] text-[#5B7A4A] flex items-center justify-center text-sm font-medium">${sessionScope.ConnectedUser.prenomuser.substring(0,1)}${sessionScope.ConnectedUser.nomuser.substring(0,1)}</span>
    </div>
    <div class="px-8 py-8">
      <p class="text-xs tracking-widest uppercase text-[#9A9886] mb-2">Accompagner, transmettre, évaluer</p>
      <h1 class="text-3xl font-medium text-[#2F3A2F] mb-8">Mes soutenances</h1>
      <div class="bg-white rounded-xl border border-[#ECEEE6] p-6 max-w-4xl">
        <h3 class="text-lg font-medium mb-1">Mes convocations</h3>
        <p class="text-sm text-[#9A9886] mb-5">Les soutenances où vous siégez au jury.</p>
        <div class="divide-y divide-[#F1F2EC]">
          <c:forEach var="s" items="${convocations}">
          <div class="flex items-center gap-4 py-4"><span class="w-9 h-9 rounded-full bg-[#E7EFDF] text-[#5B7A4A] flex items-center justify-center text-xs">${s.prenometu.substring(0,1)}${s.nometu.substring(0,1)}</span><div class="flex-1"><p class="font-medium text-sm">${s.nometu} ${s.prenometu}</p><p class="text-sm text-[#5B7A4A]">${s.sujetetu}</p><p class="text-xs text-[#9A9886]">${s.jourSoutenance} à ${s.heureSoutenance} · ${s.sallesoutenance} · ${s.qualitemembre}</p><c:if test="${not empty s.avismembre}"><p class="text-xs text-[#9A9886] italic">"${s.avismembre}"</p></c:if></div>
            <c:choose>
              <c:when test="${not empty s.note}"><span class="bg-[#E6EEF5] text-[#4A6E8A] rounded-md px-2.5 py-1 text-xs">● Votre note : ${s.note}/20</span></c:when>
              <c:otherwise><span class="bg-[#F5E9DE] text-[#B07A45] rounded-md px-2.5 py-1 text-xs">● À évaluer</span></c:otherwise>
            </c:choose></div>
          </c:forEach>
        </div>
      </div>
    </div>
  </main>
</div>
</body>
</html>


