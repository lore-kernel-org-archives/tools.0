Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B8920C337
	for <tools@linux.kernel.org>; Fri, 25 Oct 2024 20:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729887390; cv=none; b=ukLo4nrp6ioaIMTW2ZSvprFI+vXNKO1cixE4PCrIeqJZ23Cw6ZcofGckEcgT8+gP9bE2Efz2wNvQHOuD4aNGQYQypXRF8vWCchMfVL6aiqMVt+OiH31w/AwkItKhLRQp02hbGX+uBrxOpUxtYBTCDbVgsysfkKP+I2wYy3xYMNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729887390; c=relaxed/simple;
	bh=kJvsm9GhomDMOHJhodWW1GdnmVBa5bLPi5a48iHuxOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IPLOnNZVsaJal9dPnYUQdiuTe05u6y9BTUtnziIlZqIyICnYF8YlekaX6D/ZxYMOY7JG7CZ2AeLja2O17Uyww28/0bAoP5rJ2ZAoxiRBtXclTBy21iWspYhKqQpkuV3gWHevCSwJymnV7edLXCrIHEcVOfmP5pkTApTm4JrleZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwGqDl6x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwGqDl6x"
Received: by smtp.kernel.org (Postfix)
	id 86587C4CECC; Fri, 25 Oct 2024 20:16:29 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7A3C0C4CEE7
	for <tools@kernel.org>; Fri, 25 Oct 2024 20:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7A3C0C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-460ace055d8so15195071cf.1
        for <tools@kernel.org>; Fri, 25 Oct 2024 13:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729887387; x=1730492187; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wa6y9lNuzG8GTdrhCtWflcNFL1t1dxkimURS0BadncY=;
        b=VwGqDl6xM/CQXfI6bENJMOcrRBcdnq6vlRI/5V7IimmyZEHG/v5jeb2HrPYsVnK3MU
         LGMc0As6FSHQLo8/oTnQKYf9Sa4GqzG+B5Tk0ABw1vDPZIjS5vKoaOypZOTjHGHiXSmM
         aWzT57wJhcWiiYs+NRqlQsvjxkdo68S5ddTiLQw7Pp0PZxcmgaDJ48QpH8p+4XCBU/IT
         qvLjmTjGNLsx+4geDVZ/zHi99AUxtkCtOC1gNsbL1H0pla6Ih7X/kC6U9cJG8CqJJJeP
         /veGOCQDYnAxSOzyo8szbvESHahShOyWfCLuSANPkZEUO20LG9dZWPrl4ByfXNDbNCfQ
         GvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729887387; x=1730492187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wa6y9lNuzG8GTdrhCtWflcNFL1t1dxkimURS0BadncY=;
        b=iyv/Hymxsl2oyUGQloI5/tlZBndjJWU5BgPi9S7PmEcZ8aL9Hv6EP1UEQ9t2gruwPm
         Aj2UPEEmRgCy6ICogvJMIH/5qgm6T6oiq6HgGs2SKNz+8kn/yb53FR+iWVZ8u9yqu6HK
         Ber2RYjRXjnPUJyIqvL8vq0Y00g0yuIGO5mfLgN4gCuZJn5uvwaohPBWIlJA9oPePOl7
         3sXK1ONWiw16svuqn7hZoxTkkZmOgBa/0c5sVnRkWv3puk9uhqfV6oQxSfWHOvk/C5/b
         42qxyl+mR0vUGvDlrsO4GBbG5+rc3HWo5bcqQYHnbJFmW6FY5goA1ZI7lUeXxg5pTSBN
         leOQ==
X-Gm-Message-State: AOJu0YweLwgWiMkzCFu5jVcTxgBsgPX+Ays2N6iP5B8MB43uvC924Z3a
	yalDDezo2AlINl2R9E/okDpwEQdd3CPz5OQo3eqiKdXEouY4vpZUbbEx2w==
X-Google-Smtp-Source: AGHT+IHfYQAbNK0sxhVUedH0/3D2IAADCrMtmmLEBvyaVF64Ig0VU/y0qu/Blv9mkEu4UejY7e6YTA==
X-Received: by 2002:a05:622a:1a28:b0:460:ab29:e6b1 with SMTP id d75a77b69052e-4613c184d4bmr5547721cf.44.1729887387144;
        Fri, 25 Oct 2024 13:16:27 -0700 (PDT)
Received: from 156.1.168.192.in-addr.arpa (pool-100-37-170-231.nycmny.fios.verizon.net. [100.37.170.231])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4613237f394sm9124491cf.65.2024.10.25.13.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 13:16:26 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 25 Oct 2024 16:16:06 -0400
Subject: [PATCH b4 4/5] Provide overloads for git_run_command
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-better-type-annotations-v1-4-9d7a00a8d754@gmail.com>
References: <20241025-better-type-annotations-v1-0-9d7a00a8d754@gmail.com>
In-Reply-To: <20241025-better-type-annotations-v1-0-9d7a00a8d754@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

This requires explicit use of kwargs to allow decode to be a required
parameter in the negative case (which is necessary to disambiguate the
overloads).

Callers now know for certain whether they get str or bytes.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 src/b4/__init__.py | 37 ++++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index d1f0fc5b56693d7d234bc4aced65166244928728..e71fbe7d8ea8d4ca19228690ce7c186cc91b81ad 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -36,7 +36,7 @@ import requests
 
 from pathlib import Path
 from contextlib import contextmanager
-from typing import Optional, Tuple, Set, List, BinaryIO, Union, Sequence, Literal, Iterator, Dict, overload
+from typing import Optional, Tuple, Set, List, BinaryIO, Union, Sequence, Literal, Iterator, Dict, TypeVar, overload
 
 from email import charset
 
@@ -2697,14 +2697,27 @@ def gpg_run_command(args: List[str], stdin: Optional[bytes] = None) -> Tuple[int
     return _run_command(cmdargs, stdin=stdin)
 
 
+@overload
+def git_run_command(gitdir: Optional[Union[str, Path]], args: List[str], stdin: Optional[bytes] = ...,
+                    *, logstderr: bool = ..., decode: Literal[False],
+                    rundir: Optional[str] = ...) -> Tuple[int, bytes]:
+    ...
+
+
+@overload
+def git_run_command(gitdir: Optional[Union[str, Path]], args: List[str], stdin: Optional[bytes] = ...,
+                    *, logstderr: bool = ..., decode: Literal[True] = ...,
+                    rundir: Optional[str] = ...) -> Tuple[int, str]:
+    ...
+
 def git_run_command(gitdir: Optional[Union[str, Path]], args: List[str], stdin: Optional[bytes] = None,
-                    logstderr: bool = False, decode: bool = True,
+                    *, logstderr: bool = False, decode: bool = True,
                     rundir: Optional[str] = None) -> Tuple[int, Union[str, bytes]]:
     cmdargs = ['git', '--no-pager']
     if gitdir:
         if os.path.exists(os.path.join(gitdir, '.git')):
             gitdir = os.path.join(gitdir, '.git')
-        cmdargs += ['--git-dir', gitdir]
+        cmdargs += ['--git-dir', str(gitdir)]
 
     # counteract some potential local settings
     if args[0] == 'log':
@@ -2714,16 +2727,18 @@ def git_run_command(gitdir: Optional[Union[str, Path]], args: List[str], stdin:
 
     ecode, out, err = _run_command(cmdargs, stdin=stdin, rundir=rundir)
 
-    if decode:
-        out = out.decode(errors='replace')
+    U = TypeVar('U', str, bytes)
+
+    def _handle(out: U, err: U) -> Tuple[int, Union[str, bytes]]:
+        if logstderr and len(err.strip()):
+            logger.debug('Stderr: %s', err)
+            out += err
 
-    if logstderr and len(err.strip()):
-        if decode:
-            err = err.decode(errors='replace')
-        logger.debug('Stderr: %s', err)
-        out += err
+        return ecode, out
 
-    return ecode, out
+    if decode:
+        return _handle(out.decode(errors='replace'), err.decode(errors='replace'))
+    return _handle(out, err)
 
 
 def git_credential_fill(gitdir: Optional[str], protocol: str, host: str, username: str) -> Optional[str]:

-- 
2.47.0

