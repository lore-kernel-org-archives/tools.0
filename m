Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EFB18D64C
	for <tools@linux.kernel.org>; Fri, 25 Oct 2024 20:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729887388; cv=none; b=psk61Osn8zDIc3wSVVNwFLppFmMGOE3bGsZ8+3buqHp9ud7ALD1oemWvYfAbcOctqEWeRoVqlhPynOzW5eqMY3y9disahy+Sy3Z6tdlBMTsoE0Sa9J+FIpFCbi6RsBbCYnGsuqWZbWu4tTBLJDlYHMTtkbHqW96eJmbRSsWRd9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729887388; c=relaxed/simple;
	bh=UB6+NU0zjWNy22qO17xSh0+R5N6XJGd0dqy7BjoW/jo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GHD0nMul8duMo6/dlIKAzsKmysa2AVERYXBDcAkb7o1TawbKJ5u6EmlpmsMtu1TTX9pVFEFSS4LYTD1csXNX7aNQz4L2IsaqK148WT8KyPwXRr6kSAeEfk0AIDKg3MwVItp57tMUwuhOh2qXOsnUp+CPnFQAp3hginLP30knzzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXnzrcYB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXnzrcYB"
Received: by smtp.kernel.org (Postfix)
	id DCD80C4CEE4; Fri, 25 Oct 2024 20:16:27 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E876AC4CEC3
	for <tools@kernel.org>; Fri, 25 Oct 2024 20:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E876AC4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4609beb631aso15802501cf.2
        for <tools@kernel.org>; Fri, 25 Oct 2024 13:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729887386; x=1730492186; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/xIC8jetZuQkib4/cH2P0adTxMOjpEaikUwAnzYKLPA=;
        b=BXnzrcYBrNeOi1rKWLQwmnsB/rO1qeGWXuW2ypxW8mUFx6k2do539usweAUoASdeR+
         CtDSyEcnzvE1Tw/ZuxczNStUmdNbOHeiKw3v6IHMAXF6aDK59+8ZmddTSX/ztkc2P8mH
         401Lj+gjMu3DZ51juUHfpfSXgm/4SPxiLBdfLV7TLlAEQyqspMhJ4l+u3eVHrWqcLEW3
         H1Jge5ifJoRoJteCzMadAzqTDq6j8qx0yhju3bFOfeJLJoxFutJcTOODcQYFxivwtiGq
         cKBxULIYRykZynwGeAvVJoufKx87a4HtCVYl4i0Sa9HPnqjuzqimhfmp/O4Ym5vyA8MK
         ssJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729887386; x=1730492186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/xIC8jetZuQkib4/cH2P0adTxMOjpEaikUwAnzYKLPA=;
        b=slaHNPvnU1SRfEwCecy9wV6yzlwuPYnu6W2uCxflLIEJyaKXc1iXafJWbMBkqbQ3zX
         M51dbvP/RSt3cY7zHCsDgOpfHVfgSTRTohXZvvG4ptRzRw8zTnEd/YxRnnHjZ23xNUPu
         wUuMowEBuO/AZ6Ov3CmDvusoZIAWefxGqU+NRsIL4hIo5GWQgo6YVWCYFaOAoqCQcYxp
         qFCIBjsDWnZ/7wDCPDImQ8jhXi2RdAe2wIxx3BJT9oagKuxzNPMtsKQrHKCyi83xcDyf
         uvb8/4nKfJGYYtk/1RXH/43roSvMidTzSPgUJ/Era28rcBMwsc3uqb6rXwsnuZ8L2EpB
         8qYQ==
X-Gm-Message-State: AOJu0YyQkKUQA3s1SiFs7yQ6qF8PiB2u5WynWpDWysUibem8RAeXrYiX
	ji06oNGLxRAjldhzLEY0bv8Vj2UPvp90gjQc6tJpeHpEDOj3dFb7jdytkw==
X-Google-Smtp-Source: AGHT+IE+Km20S1oOMdLUF5PNPS2Fr+sLaCrrlIGC6k0MwrZrkv8PvXacFQ5LI9D4AenvrMSBRpnEFg==
X-Received: by 2002:a05:622a:246:b0:460:913d:cf25 with SMTP id d75a77b69052e-4613c176f5cmr5251061cf.50.1729887385736;
        Fri, 25 Oct 2024 13:16:25 -0700 (PDT)
Received: from 156.1.168.192.in-addr.arpa (pool-100-37-170-231.nycmny.fios.verizon.net. [100.37.170.231])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4613237f394sm9124491cf.65.2024.10.25.13.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 13:16:24 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 25 Oct 2024 16:16:05 -0400
Subject: [PATCH b4 3/5] Correctly type annotate generators
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-better-type-annotations-v1-3-9d7a00a8d754@gmail.com>
References: <20241025-better-type-annotations-v1-0-9d7a00a8d754@gmail.com>
In-Reply-To: <20241025-better-type-annotations-v1-0-9d7a00a8d754@gmail.com>
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

