Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853A231987B
	for <tools@linux.kernel.org>; Fri,  7 Nov 2025 13:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762523512; cv=none; b=MolIMhMWv5GEdUYpxyfQkgcVTlpx2oZgs3s0cEui4Ff4BSh+97fTYvGYlh9W0x4OeWcWatGXx8ole3bTM1w+052If1ODk2Jeet3ciUVm/hbT/dXUByU3TXOTzmYJIExovsUw2NFtttF18f+NDk2eTKvjYNSzbyw4eKW3d/zGCd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762523512; c=relaxed/simple;
	bh=AjGh8SA8C/S+Z07wSKd2vMchHzTu9EI9zu2UBUW45sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZC2U4C//JOADU/hIf3oVharJJ48Q6S6GBMsgxJfWMc9je+GXncgwwyoK/B8T73N2yeugqDrJDkf7yX7+c78t4AJFNDsZUxvc/Y7oc1fswtGbGWXqxOJvGfmQ5dSrHiXKlTnxa5kgDsUwSuwHa6vuk8ItAjm5saovcAdDNeVvZf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LGeDEjyf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LGeDEjyf"
Received: by smtp.kernel.org (Postfix)
	id 49C07C16AAE; Fri,  7 Nov 2025 13:51:51 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 20E25C4CEF5
	for <tools@kernel.org>; Fri,  7 Nov 2025 13:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 20E25C4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4711b95226dso7709475e9.0
        for <tools@kernel.org>; Fri, 07 Nov 2025 05:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762523508; x=1763128308; darn=kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3GY+NXb5ALjsDJSVd/V3VNpJir9tsY3vxiknLaVNDeE=;
        b=LGeDEjyfCrsrLIyPHM+I82aPbmoBflcitd0QX9eGej2nJ2LLwmkZX6N6YsNE8V6jvD
         ai47kg85gBgNVNp4QUGOlKfXPZ/fhuvqqx+Xwm3A63pOANcrpEpn22TQVAfCAU/llI3E
         VDjSKaMM6tq/+f275u+HDzvC1+ALq74RBhR6jf3yiy+qCP5cw46IlnWbFDvP3LuJALb+
         H3SgvnuQZv8WHKoLh1akJ9Zo/If/gshXkUBuYHCChiyAGoDw121uyxKgzyqzsgb6xB2N
         dE11bal/dDjWmtYPnU9CHrL4yKO7/eJY1dl8zybXt4rW4c+RDvG9je1zqDk7nTTY6SUz
         cUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762523508; x=1763128308;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GY+NXb5ALjsDJSVd/V3VNpJir9tsY3vxiknLaVNDeE=;
        b=qMK7GP1WpmdxpXtYM8NvYKhSxLzpAAcPnHBrLRakg4lFfmYsBkbApE5ASvBl69CXax
         eT66h/+0GZx38eH2DtVuhEMG/uqbSXxQ76uN0Y3O+aTHBEfzBe0RjdoitEdffbQXt69w
         Yhy69S1mAngWsHcetyuRs9KYLYiVNIbagEYovGEX7Zk/0kHxIg93b+VbijnfvUF1PpNe
         hGQQQyjXBM/u7b0kQWpRaFUJjp5qO1GobT62pXbeRVkz/td2Xrnl89v5Ns+zJMjt/5NW
         vQksICOYh8gQZUU1F6sC7gi7uhW8CbI1bBX8z/96g2ZePho3QVKN5N+lE05BnyeLecfL
         zacw==
X-Gm-Message-State: AOJu0YzQ7pIAkATj8nq2SVJgmn9+LQw+hmQS5t+8UBONBl2bQJNaorZg
	IdtzxQHafCQxjtQOIFU425GyKl/maRIMxihOthYjjTR/T8psgKbdaHuypZ2sHpecvBTlSSgXkfg
	1xgIU
X-Gm-Gg: ASbGncs9HxlccT1xmHE7PbWdMtCX6dVJserWZMnw9SaOU4g4Qw6fhUpeJJi/oshF2QH
	ik7zumnZ+uq+vDB4vW1rA2GXpDbAapQHihipvNfapkQKqo6Mh6m7Eso8utAYLT7EGbJWXyXSexM
	mjWeXVy3dPKKRzZVruo+tVE6XlLevJ/j5TIeL2HO06bHM/MIkTmq2y7aBIzHO2MpBp9fm/9/5Iw
	w9YGMy3jvLb7QZxhtwppDLiIMjuxCmzRXm24rmJmLNSwzIiuh9mhZK8Yb1t8f8K6qOOtT7nEyqn
	/QMaBJTs2oMYi8xnI4xpASJrbbWVz8VDcQH9QavDroMJ+lRYNPlS2PWz8mxDPRV2F+B/AfiyB8a
	ZAsjFtnNg4UfaZERNKmDsOFaIBdQqf5fHNMJiU4kkVH5m556uw2pBmZ6f7WLQ/+IFpBNs3pey5l
	OyfgJmRoWhVI9Un52Qnz69s/s=
X-Google-Smtp-Source: AGHT+IEgtdXN6MyIwnbhaP2Miq3/AsfMdlwDeWIr/h5IXzdLaqDCwQaSQTiv9jf3tp0OzKglemZSPg==
X-Received: by 2002:a05:6000:2901:b0:3ff:d5c5:6b0d with SMTP id ffacd0b85a97d-42adc68a252mr2632688f8f.4.1762523508019;
        Fri, 07 Nov 2025 05:51:48 -0800 (PST)
Received: from [127.0.0.1] (99.36.160.45.gramnet.com.br. [45.160.36.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe62b28asm5433995f8f.6.2025.11.07.05.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 05:51:47 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Fri, 07 Nov 2025 10:51:35 -0300
Subject: [PATCH b4] prep --check: Add support to spellcheck is codespell is
 installed
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-check-codespell-v1-1-cacd9d69b434@suse.com>
X-B4-Tracking: v=1; b=H4sIAGb5DWkC/x3MSwqAIBRG4a3EHSeo9JC2Eg3MfvNSVChEIO09a
 fgNzsmUEBmJhipTxM2Jz6NA1RW5YI8Vgpdi0lK3SsleuAC3CXcuSBf2XXRGK22tN0aCSnVFeH7
 +40hzQ9P7fsTRz5ZlAAAA
X-Change-ID: 20251107-check-codespell-68212aaf880e
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762523506; l=1750;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=AjGh8SA8C/S+Z07wSKd2vMchHzTu9EI9zu2UBUW45sU=;
 b=CEItiN2JjWPmi5eRZL2o0CxNZc7IPDOibMSKzs8t8b/BNGzYMT6uVnN/MU2/C/vaVxbLP2HZN
 I6NC6VOLcqyCsDDg8OKO0XYk8QQBqlYA2z3WZsru+6Q7iUSc960b+4v
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

This commit add --codespell to checkpatch.pl is the codespell package is
install.

If b4 is installed with pipx you need to use --system-site-packages when
calling install, otherwise it won't see the packages installed by your
package manager.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
@mricon this new feature was added since I forgot to run checkpatch.pl
--codespell when sending the patch to the ML. I believed that b4 would
do such check, but I was mistaken. What do you think about it?
---
 src/b4/ez.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/src/b4/ez.py b/src/b4/ez.py
index 57bc1ca..1c70f7f 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -43,6 +43,12 @@ try:
 except ModuleNotFoundError:
     can_gfr = False
 
+try:
+    import codespell_lib
+    can_codespell = True
+except ModuleNotFoundError:
+    can_codespell = False
+
 logger = b4.logger
 
 MAGIC_MARKER = '--- b4-submit-tracking ---'
@@ -1809,7 +1815,8 @@ def get_check_cmds() -> Tuple[List[str], List[str]]:
         if topdir:
             checkpatch = os.path.join(topdir, 'scripts', 'checkpatch.pl')
             if os.access(checkpatch, os.X_OK):
-                ppcmds = [f'{checkpatch} -q --terse --no-summary --mailback --showfile']
+                spell = "--codespell" if can_codespell else ""
+                ppcmds = [f'{checkpatch} -q --terse --no-summary --mailback --showfile {spell}']
 
     # TODO: support for a whole-series check command, (pytest, etc)
     return ppcmds, scmds

---
base-commit: 509f56ff5c24e2ad48cd2621e54c67910ea19fc1
change-id: 20251107-check-codespell-68212aaf880e

Best regards,
--  
Marcos Paulo de Souza <mpdesouza@suse.com>

