Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E9328371
	for <tools@linux.kernel.org>; Tue, 18 Nov 2025 19:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763495700; cv=none; b=E1IqZxKaI1zztMPdImGwqYW2jUZgWVKcqEgF+2g1Mb7QmF7D5u71eg12JXL26a+/58xep3UOA2vHf0/ASbvF8CQu0P15otQitRhr9LRcwCEwc9wmUyLCOST6aCRYc1dVwiJYOJSkfgBzgFsWbVxxVtSyeicldOxTXeiIMNsfm9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763495700; c=relaxed/simple;
	bh=EAZB3eTvAEbaD7elPm7uSlcqaR86xtbYSb1JzanMNMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Fl0VKhBDmz6fLgoDYCUtsvvlIgPfAxSrZSozLShY0Coy9GOpRrg5OfSneF5M+2nlmb0NhMrr6Tc4jvtFhnWSOpS9jKgsfcnUgo6L5slScSx9upn6hSnenlKdBBpP9uNVPt9GrFZOwKhP+tMfaOOt9jhOf7vUDVHk4se6murqAac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SPqW/GIe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPqW/GIe"
Received: by smtp.kernel.org (Postfix)
	id 1358DC2BCB0; Tue, 18 Nov 2025 19:54:59 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0F37EC2BC87
	for <tools@kernel.org>; Tue, 18 Nov 2025 19:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0F37EC2BC87
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8b1bfd4b3deso462731585a.2
        for <tools@kernel.org>; Tue, 18 Nov 2025 11:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763495690; x=1764100490; darn=kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HfnrnTZfyda6swwpLg6j3x8VtX7hHfO6QHdTOC95Aos=;
        b=SPqW/GIe9mMgehZxSWdxv/h+WlzRRALMEVTSDtE+ajamzmAQ1BycxmWbSuLhng0oLx
         4X+od2oQgZtIABLiYm0ErZPMZPwG4efXFTr7sThZMx0pjwfUr7J5OrVKUmfwfL+EKHA0
         fUiOoRLH9xoK8+mTa8UZiiQg9/tkS8RKPKX8DEypHyuQ7JXwZwxwACubIM1gvAdpb8kY
         7PY6rys3br2t4o1XSv0g6W75weYGN/3O1T5jHAzHJOxu4YoTS5Ez7GdnpVaQG8A0lUC+
         hkDu6LzLyhNt9Tb/Pk+ajm4du24A5HF8Sq6fgqrZNhMkUPHWXP02w6vZkNf+PjMNuL/I
         SQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763495690; x=1764100490;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfnrnTZfyda6swwpLg6j3x8VtX7hHfO6QHdTOC95Aos=;
        b=BrYyCuQc7JxOGQ5/BD4cGIqQl6LA/H33T04GxWtsov8vVlTbendfVX71xjHtbWuLjD
         +YPEU6wm6z1lLC+giXeTESRawAtixgNjprcG47MwE+GjpPuf2ubzCS+azlhV4+84utzE
         ciardhbYD+NRw29uvCobX2zocrFrvhecIX5S4ZOaLKVVLSH4nmBEhhjEz3Uivehscpev
         jJuSIIw4iujgMOT/dqz6LdcEtiCwe0E018t7BnmZI5MbtM/sPNAcR/rgZnf4JPVRxmoe
         TDAlcW2yTLvK6KNGzwgOshgH+il85w/6GAWR45P9d9wkg6MXKMHf6mLBRqgPFKhkMfu6
         bHpg==
X-Gm-Message-State: AOJu0YxtW26r5Oj/gv4nWCc97vY26TN3ij9oRAjhc84MTB/nPuQUbSw0
	wkhc46aqUH0y0Pzi0Li7wuA5lrby9a5o2HLmJ2kc25FfaImDGh0C/AZ8
X-Gm-Gg: ASbGncv3H9iZTGLpOO7d6oDTSbC/jL1TiNpWtJQW5VLf+nmov2vb5fYH8ChY32HuVzE
	Uxlo/N/tgr0coG78cmRIKDAJxOVTmPtFGiIj8BibWvdyDeGLx5qS7/amQgNJso/72IfJiKvLHO2
	6MZ0FPeHn0WvSZLF2A1Tiwv4qI0b1Awvr1g+nrX/BPRWHrRpvlHcpCPCXa2rBZFUuzBdcA2znv/
	RgA8SByI4lVFIHOWcTLBbnvloJViMphQPQui/PpNgd8SDJmyUD6SgIapaKuMNdfTnj97vL0XO6/
	HHlfHa3n5ksOe/onj/RLcjZ/ucAxr6RRZblfuWy7ZgWt2gO4e8F17dDkIc9BEK1FtLcLjJE1Ndu
	r9WdkpAmDftgO4iXg5KbZpcLbXZo0tzT84Dso5AiqowdkucUrcFc1RIx8og8xVc2iSz1LycrIwY
	aTVV55YWeiyVLg5CIlJeW259JoYDZRYqMlOJVPEqVvO8bYb2pFJ7Lk3J/8mXIG3ZvchP3cOoHzI
	jAjMJor4CSlWMjWbljNnq5+NLSDa07m2c2+lfD7UgqF5hgpeu6l1/wFBkfC4Fr/IYS62n3k6WGy
	Ou+dbWu2qHjFIqlb6MB2jKrf8BYcFnENiJQNMPu2N1Ijwx84
X-Google-Smtp-Source: AGHT+IHGoaxODUSUM4u1kapP8WiwwEb0nwZfmIhIwwJp5OT+wknnjA+LBHvyMr7Mb2sCvKWVRwwJ5g==
X-Received: by 2002:a05:620a:29d5:b0:8b2:f182:6945 with SMTP id af79cd13be357-8b2f1826beemr816299685a.58.1763495690082;
        Tue, 18 Nov 2025 11:54:50 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([148.76.185.195])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2af062acasm1255316185a.53.2025.11.18.11.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 11:54:49 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 18 Nov 2025 14:54:45 -0500
Subject: [PATCH b4 v2] Update shtab requirement to >=1.8
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-bump-shtab-v2-1-6bb1e2f11d8a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAATPHGkC/22Myw6CMBBFf4XM2jFOGYy64j8MixYGmEQeabHRk
 P67DWuX596cs0MQrxLgUezgJWrQZc5gTgW0o50HQe0yg7mYiohu6N7TimHcrMOSuarI9WVn75C
 F1UuvnyP2BMfQ5G3UsC3+e/QjHc+/VCQkZDLXtqeOhLkeJquvc7tM0KSUftOSP2yoAAAA
X-Change-ID: 20251118-bump-shtab-344551bf3da9
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1763495689; l=1289;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=EAZB3eTvAEbaD7elPm7uSlcqaR86xtbYSb1JzanMNMc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJiSdqQBqJk2rCKDpD0LLhoQEl+QgobDfrIlQ86flc79IGjF56h7qopbz/f7dKqmyJ0Lyvb/wkb
 6cNh0d7U91gc=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

This release fixes tab completion in zsh. Bump requires-python to >=3.9
to avoid warnings caused by shtab requiring >=3.9.

Link: https://github.com/iterative/shtab/issues/183
Link: https://github.com/iterative/shtab/commit/ad3d4ced44167362fe5031156b7c5fdca59cd02b
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Changes in v2:
- Reverted requirements.txt.
- Link to v1: https://patch.msgid.link/20251118-bump-shtab-v1-1-4126cf1d1e44@gmail.com
---
 pyproject.toml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/pyproject.toml b/pyproject.toml
index 7b2c6e2..de7f41e 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -12,7 +12,7 @@ license = {file = "COPYING"}
 authors = [
     {name = "Konstantin Ryabitsev", email="konstantin@linuxfoundation.org"},
 ]
-requires-python = ">=3.8"
+requires-python = ">=3.9"
 classifiers = [
     "Environment :: Console",
     "Operating System :: POSIX :: Linux",
@@ -40,7 +40,7 @@ dev = [
 
 [project.optional-dependencies]
 completion = [
-    "shtab>=1.7",
+    "shtab>=1.8",
 ]
 
 [tool.setuptools.packages.find]

---
base-commit: 509f56ff5c24e2ad48cd2621e54c67910ea19fc1
change-id: 20251118-bump-shtab-344551bf3da9

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

