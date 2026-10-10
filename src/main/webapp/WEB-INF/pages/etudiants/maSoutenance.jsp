<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Ma soutenance - Étudiant</title>
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
      <span class="w-9 h-9 rounded-lg border border-[#3A5240] flex items-center justify-center"><svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5"><path d="M22 9 12 4 2 9l10 5 10-5Z"/><path d="M6 11v5c0 1.7 2.7 3 6 3s6-1.3 6-3v-5"/></svg></span>
      <div><p class="text-sm text-white font-medium">Espace étudiant</p><p class="text-xs text-[#9FB89C]">Année académique 2024-2025</p></div>
    </div>
    <p class="text-xs tracking-widest uppercase text-[#7E9078] mt-6 mb-3">Mon espace personnel</p>
    <nav class="flex flex-col gap-1 text-sm">
      <a href="${pageContext.request.contextPath}/Etudiant?page=tableauDeBord" class="px-3 py-2.5 rounded-lg hover:bg-[#2A3F31]">Tableau de bord</a>
      <a href="${pageContext.request.contextPath}/Etudiant?page=maSoutenance" class="px-3 py-2.5 rounded-lg bg-[#2F5B45] text-white">Ma soutenance</a>
      <a href="${pageContext.request.contextPath}/Etudiant?page=monResultat" class="px-3 py-2.5 rounded-lg hover:bg-[#2A3F31]">Mon résultat</a>
    </nav>
    <div class="mt-auto rounded-xl border border-[#3A5240] p-4 bg-[#24382B]">
      <p class="text-xs tracking-widest uppercase text-[#9FB89C] mb-2">Session de juin 2025</p>
      <p class="text-white font-medium mb-1">Votre avenir commence ici.</p>
      <p class="text-xs text-[#B9C2AF] mb-3">Un projet, une soutenance, un nouveau chapitre.</p>
      <p class="text-xs text-[#D8E4A6] flex items-center gap-1.5"><span class="w-1.5 h-1.5 rounded-full bg-[#D8E4A6]"></span>Ensemble, vers la réussite</p>
    </div>
    <nav class="flex flex-col gap-1 text-sm mt-4">
      <a href="#" class="px-3 py-2.5 rounded-lg hover:bg-[#2A3F31]">Aide &amp; contact</a>
      <a href="${pageContext.request.contextPath}/logout" class="px-3 py-2.5 rounded-lg hover:bg-[#2A3F31]">Se déconnecter</a>
    </nav>
  </aside>

  <main class="flex-1">
    <div class="flex items-center justify-between px-8 py-4 bg-white border-b border-[#E9EAE2]">
      <p class="text-sm text-[#6E6D5F]">Espace étudiant <span class="mx-2">›</span> <span class="text-[#2F3A2F]">Ma soutenance</span></p>
      <span class="w-9 h-9 rounded-full bg-[#E7EFDF] text-[#5B7A4A] flex items-center justify-center text-sm font-medium">${sessionScope.ConnectedUser.prenomuser.substring(0,1)}${sessionScope.ConnectedUser.nomuser.substring(0,1)}</span>
    </div>
    <div class="px-8 py-8">
      <p class="text-xs tracking-widest uppercase text-[#9A9886] mb-2">Votre grand rendez-vous</p>
      <div class="flex items-center justify-between mb-8"><h1 class="text-3xl font-medium text-[#2F3A2F]">Ma soutenance de fin d'études</h1><span class="bg-[#E7EFDF] text-[#5B7A4A] rounded-md px-3 py-1.5 text-xs">● ${maSoutenance.statutsoutenance}</span></div>
      <div class="bg-white rounded-xl border border-[#ECEEE6] p-6 max-w-3xl">
        <div class="bg-[#F7F9F0] rounded-xl p-5 mb-6">
          <p class="text-xs tracking-widest uppercase text-[#9A9886] mb-2">${etudiant.niveauLib} · ${etudiant.filiereLib}</p>
          <p class="text-xl text-[#5B7A4A] font-medium mb-2">${etudiant.sujet}</p>
          <p class="text-xs text-[#6E6D5F]">Encadreur : ${etudiant.encadrantNom}</p>
        </div>
        <div class="grid grid-cols-3 gap-4 text-sm mb-6">
          <div><p class="text-xs text-[#9A9886]">Date</p><p>${maSoutenance.jourSoutenance}</p></div>
          <div><p class="text-xs text-[#9A9886]">Heure</p><p>${maSoutenance.heureSoutenance}</p></div>
          <div><p class="text-xs text-[#9A9886]">Lieu</p><p>${maSoutenance.sallesoutenance}</p></div>
        </div>
        <p class="text-sm font-medium text-[#5B7A4A] mb-3">Un jury pour vous accompagner <span class="float-right text-xs text-[#9A9886] font-normal">${jurys.size()} membres</span></p>
        <div class="divide-y divide-[#F1F2EC] text-sm">
          <c:forEach var="j" items="${jurys}">
          <div class="flex items-center gap-3 py-3"><span class="w-8 h-8 rounded-full bg-[#E7EFDF] text-[#5B7A4A] flex items-center justify-center text-xs">${j.enseignantnom.substring(0,2)}</span><div><p class="font-medium">${j.enseignantnom}</p></div><span class="ml-auto text-xs text-[#9A9886]">${j.qualitemembre}</span></div>
          </c:forEach>
        </div>
        <div class="mt-6 pt-5 border-t border-[#F1F2EC] flex items-center justify-between">
          <p class="text-xs text-[#5B7A4A]">✓ Votre convocation est disponible</p>
          <button class="border border-[#E3E1D6] rounded-lg px-4 py-2.5 text-sm">Télécharger la convocation</button>
        </div>
      </div>
    </div>
  </main>
</div>
</body>
</html>


