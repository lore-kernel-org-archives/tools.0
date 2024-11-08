Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D922F1E511
	for <tools@linux.kernel.org>; Fri,  8 Nov 2024 12:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731069149; cv=none; b=WV7kNLy2GJBESkeSo9HdSGEatL18Kn1i9aeY6AIVWB8OvlA85779dNXDTS244Ou7IpRelBr2UGChnCkx+xrUVT+I5CkAqbLu3WIjhjAzLY++BjisFD9w4cKS1NJwWqnyyBibuCmzKXvuxfAYrqxdRRJFHbEs9/U3jbKBli4gKBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731069149; c=relaxed/simple;
	bh=kJvsm9GhomDMOHJhodWW1GdnmVBa5bLPi5a48iHuxOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m6TiFqgOsa9ErRIx3zYRcwcykqJ7LCSGhdG8xEztYCj2wQrvolpOrX/nAKRjOzzbKCIkR49MAH+eVpWwr75U2dT6yZ1ZpIT9asl51Y4SUyNmtLWZbNoJx5Wa3QT/5Kd+wyjtbbu7vnQthHq2bWeVE/ruSgCKHaJGDztci4tbVnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+3Y7aRv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+3Y7aRv"
Received: by smtp.kernel.org (Postfix)
	id CBB1CC4CECD; Fri,  8 Nov 2024 12:32:29 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9D297C4CED4
	for <tools@kernel.org>; Fri,  8 Nov 2024 12:32:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9D297C4CED4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-46096aadaf0so11964351cf.2
        for <tools@kernel.org>; Fri, 08 Nov 2024 04:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731069146; x=1731673946; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wa6y9lNuzG8GTdrhCtWflcNFL1t1dxkimURS0BadncY=;
        b=f+3Y7aRv/5voLdXKpzkTXNxBB/6w5qbFCYVE66cA5kxtqsYN6HtTxTfg+mdsTJW675
         mqwzH8O9EOMKSEatgpQSCo3wb9E1sqStvJHKL08chiarlPeXO+IMOolAtSMTIoA1A5+s
         EJb1tyOsGsXEX0elnKl+5ussJh+0cAvVbC1WCPApuR4iyeBbFJxh0ZyluCfHd2EAbvoV
         AQdZXCwJ68C8An4lFbU/2QxxbKZJlsYbfu7AgL7HgMabDS+PWtqB5lTeIJAu1AhtMxuo
         YcRwlMsjUGCNIjl23ACzr1yaGqOqGpFoyNY0B9rSKnQJHtMTH5sbbWYwVk/yckDbGh2o
         dkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731069146; x=1731673946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wa6y9lNuzG8GTdrhCtWflcNFL1t1dxkimURS0BadncY=;
        b=Sj0RMSkIr7QoRsAE7soO1tA+QGhQjVdxmVDLMgaxFqZh77oOTqIlKK3egR+JhxcLLP
         e1WtIKBH8fgLclOgJ+KLkLRB+P3imNMg2vVKkw33pUcpdj3CXJyHlaPTUxhmNNd/mcV4
         BbjNy/grQlUKjEWTXuJuP82UAkbXV1B4KVJeYWCwrj4VWqvMxTyVl3PNnqAPVs1XcRjo
         NiUl/0NlWCqCcP40DK7Utc30Tem/wBnoSqXra5/9n5qLzpxjrYES1m6Sc3YmhC7Zpiiq
         aXNKFQ2Po4zHXq20MOvNvN0sh+oFkeUv3XAb/WPasqW+mkJVPeFt9/WrCP6KQA6C1mk8
         vTZQ==
X-Gm-Message-State: AOJu0Yzz95DHIiO04C0a7rt8r33r+dYQcP0V5gXtrnLbNFKadwK4pwUC
	AAOk9D+Woc/AiXp3wfkAP1cd+kEzp6XiMxIPCH9qZqezHn8iNbdgCjOklc9h
X-Google-Smtp-Source: AGHT+IEklbiMXQw8NL/BvUDq+Pi79wI1Anz365bsL2skjorOPRbMc75gIHqBR8ThH9+Y7AqbkIewsA==
X-Received: by 2002:a05:6214:3a84:b0:6cb:f195:22c7 with SMTP id 6a1803df08f44-6d39e19ff5dmr31204966d6.38.1731069146551;
        Fri, 08 Nov 2024 04:32:26 -0800 (PST)
Received: from 159.1.168.192.in-addr.arpa ([2600:4041:5be7:7c00:348d:4cbf:ba75:f557])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3961ef48csm18633436d6.35.2024.11.08.04.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 04:32:25 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 08 Nov 2024 07:31:31 -0500
Subject: [PATCH RESEND b4 4/5] Provide overloads for git_run_command
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-better-type-annotations-v1-4-ebaf0129d9e1@gmail.com>
References: <20241108-better-type-annotations-v1-0-ebaf0129d9e1@gmail.com>
In-Reply-To: <20241108-better-type-annotations-v1-0-ebaf0129d9e1@gmail.com>
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

