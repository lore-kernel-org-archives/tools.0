Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37B71E0DD4
	for <tools@linux.kernel.org>; Fri,  8 Nov 2024 12:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731069148; cv=none; b=sjd+ud7jtfbGVXJ3mGq2OUHXFwM7I2/ZoiU/0ywm0f4MIOrFWtQU/lbNcoIXAmS0+L8tlHewW/xEi20atD5xqd3dk72lknObj+KdOh3pRJkyo4pIVDcAC1pU+1xKVSGmrHt4LqlSs/2vcUVIeYfCHiDVT0OkxNabL+cIk/tMyV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731069148; c=relaxed/simple;
	bh=UB6+NU0zjWNy22qO17xSh0+R5N6XJGd0dqy7BjoW/jo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hDPER2fJkWpGCdUiFgoSIpLcHQ99U59aMNplXZS5NMukoFAdIEPHfY7aoeNuJsK6zASu6jepuweYnInyi+YOLdjnKlgbl4Xzc85+05TlyAYryoTT2Zof8cVXdv0giFftBzqn2YumVC4tkUkV+hpyT5KCzz2Sh8PxBWHzSw+wC0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJ/M0Sfn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJ/M0Sfn"
Received: by smtp.kernel.org (Postfix)
	id 7DD6CC4CECD; Fri,  8 Nov 2024 12:32:28 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A35C9C4CECE
	for <tools@kernel.org>; Fri,  8 Nov 2024 12:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A35C9C4CECE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-460c316fc37so12756311cf.0
        for <tools@kernel.org>; Fri, 08 Nov 2024 04:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731069145; x=1731673945; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/xIC8jetZuQkib4/cH2P0adTxMOjpEaikUwAnzYKLPA=;
        b=EJ/M0SfnxIOeDZtCH8JhUre4sbSGAZmDkteu4nsGfoH69atFATap4cjfQdXyB2lZDF
         vk2PE9Q5Fhturho6fFHKMlTsqn7V7HUdhGhC0llBjG9ngnmH6p01F0p4XoIgJ5z51Xl9
         uQ4YkVIxwvmK8uXsYHmLQJjV0mNKlw8TzchoPqSx7h5S1tdIJWiXROI1Rd9gLKKrayDS
         0PJUafoF1TlDDcyKQ6Jgk+q621XNTrLz2fvXJy4WFg8RutDUQDrG2SMyUTNvJPePmFTq
         zxD2R8B/XErh/GnyO66QyBOMTy48qCoywuAZdMUoeifY4ndRoy6eGdWNMd+wIywISFis
         s37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731069145; x=1731673945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/xIC8jetZuQkib4/cH2P0adTxMOjpEaikUwAnzYKLPA=;
        b=SJQ0vE/73CyEYG+Kw0OkQiVSwGJ4DTKVbt2c22AAdrW1UQZ6rXOLuffvZz3dYck9L9
         zkL5Z79o0COKaxMkMpXcrQ7keL0ZvQwguVuBKdu9NDEBnCK7AIld5bJUq5VBUMg6qfp7
         dvE4Hv9muOoBZIBDioXANt3w+3JPk/z2F06fLG+1N/HUhWLSW7X0tbsj50zQysi8ZVkY
         2JHYENfSi7w8FQtUwa6sVOuGX0xChZ9guJU8PX37oCkMU458QIfku3/S/lN6KycCJVCn
         7LN7YwvtpFboKBo50+S6+lB36nip8L9ndCNzuYJ935CfWxhXiq8h0tJ4meHBn70JvUWe
         TTBw==
X-Gm-Message-State: AOJu0YwdFX7OG980thmhyaSL4MHRetqkextbZqQTjug3U0z5Doc3LVEC
	Tbn7wexli8IJYbU99h+7dQWw111SCEwAP5fLz3LL/zdvyNt7Bk6T8R3/KT7r
X-Google-Smtp-Source: AGHT+IHSF9bOrQAPRMth1GZ/4N9+S9yp8w7Kyjxt0b8i3qOt8HnQ3Adp/k9nBgyd1nmrTnhniIEEOQ==
X-Received: by 2002:a0c:f207:0:b0:6cc:b4:5dcb with SMTP id 6a1803df08f44-6d39e1f49e6mr29509196d6.47.1731069145521;
        Fri, 08 Nov 2024 04:32:25 -0800 (PST)
Received: from 159.1.168.192.in-addr.arpa ([2600:4041:5be7:7c00:348d:4cbf:ba75:f557])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3961ef48csm18633436d6.35.2024.11.08.04.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 04:32:25 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 08 Nov 2024 07:31:30 -0500
Subject: [PATCH RESEND b4 3/5] Correctly type annotate generators
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-better-type-annotations-v1-3-ebaf0129d9e1@gmail.com>
References: <20241108-better-type-annotations-v1-0-ebaf0129d9e1@gmail.com>
In-Reply-To: <20241108-better-type-annotations-v1-0-ebaf0129d9e1@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 src/b4/__init__.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 5115a9cd9b8746f84eb104a2be69fe121724167e..d1f0fc5b56693d7d234bc4aced65166244928728 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -36,7 +36,7 @@ import requests
 
 from pathlib import Path
 from contextlib import contextmanager
-from typing import Optional, Tuple, Set, List, BinaryIO, Union, Sequence, Literal, Iterator, Dict
+from typing import Optional, Tuple, Set, List, BinaryIO, Union, Sequence, Literal, Iterator, Dict, overload
 
 from email import charset
 
@@ -2758,7 +2758,7 @@ def git_get_repo_status(gitdir: Optional[str] = None, untracked: bool = False) -
 
 
 @contextmanager
-def git_temp_worktree(gitdir: Optional[str] = None, commitish: Optional[str] = None) -> Optional[Iterator[Path]]:
+def git_temp_worktree(gitdir: Optional[str] = None, commitish: Optional[str] = None) -> Generator[str]:
     """Context manager that creates a temporary work tree and chdirs into it. The
     worktree is deleted when the contex manager is closed. Taken from gj_tools."""
     dfn = None
@@ -2776,7 +2776,7 @@ def git_temp_worktree(gitdir: Optional[str] = None, commitish: Optional[str] = N
 
 
 @contextmanager
-def git_temp_clone(gitdir: Optional[str] = None) -> Optional[Iterator[Path]]:
+def git_temp_clone(gitdir: Optional[str] = None) -> Generator[str]:
     """Context manager that creates a temporary shared clone."""
     if gitdir is None:
         topdir = git_get_toplevel()
@@ -2794,7 +2794,7 @@ def git_temp_clone(gitdir: Optional[str] = None) -> Optional[Iterator[Path]]:
 
 
 @contextmanager
-def in_directory(dirname: str) -> Iterator[bool]:
+def in_directory(dirname: str) -> Generator[bool]:
     """Context manager that chdirs into a directory and restores the original
     directory when closed. Taken from gj_tools."""
     cdir = os.getcwd()

-- 
2.47.0

