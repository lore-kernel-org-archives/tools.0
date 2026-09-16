Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58D339A078
	for <tools@linux.kernel.org>; Wed, 16 Sep 2026 08:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789548206; cv=pass; b=QB9qO/NTeN2rzsHq/ZIYuqnlQoqkyL4NuwAtV00WXepZnxIlbbSMz+rle7CpuN7et2A4qMBl2mlwE4SxAPHZpxFtruMdTIG1FRvNOFfVhWS/3VmGaG3eNXZ4f1SNr9BQ3r328YiDIyIPTEDin75qS/VUVRnyfhSTfdnw/7+ynW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789548206; c=relaxed/simple;
	bh=3zZOzIOCPaPSyxlDuRgsJstq1ECS6nWcz2tDTVDR/hI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tMAQmR59BUya3ESQVK/U8fVSPCq/aThDXsCXpy3LLvf4yqUUufcbdAyMo3iaMzG0YBdwf6F+HqjrZSwyXTUFesl8OwjoX6O55scpg3J8nHpCf7K5u1HJ9CZHSl7aVYV4V29G9gkemkRoY0LW+jNdSKXOFxJePxHSue5YQPGypeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=LRCtO0p1; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="LRCtO0p1"
Received: by smtp.kernel.org (Postfix)
	id 591D81F00893; Wed, 16 Sep 2026 08:43:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.228.91
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1789548204;
	b=ksGeztvsQpqkXvRb14mP6eQrh1H0ADhu/IqZmzFMH/h8xw6U5bwmUFrwtXj3dKBhM5/t
	 r9ewyfeyMiGFGlp4x8Byt8/yGYlAWFF7Bx8oPvUGCXp7XzFW82Y76NmB1e3zX1/j92VlQ
	 mpfD2AuwQ4YRkqoG1xLdOJqEXXumypFHL58ldtpr76JLQWk0OQzjU/0dEblTRYQdrpfcF
	 oqAI305rORLzg1t4R09yxcN+JFzCjsKoLkId5majjsqlfJium5cyDWSGxPIwSXVrdtFd8
	 F/dQM9LVmaEx0nuRPOpIBeeNAm6b/W+TK/vlraH9R4KvzzY1zwun3Ww9oEn85ZGrxwA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789548204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=QEbGpmw69znx0BrzK0qohQ0axjwSqcP/PmhoDr48RLw=;
	b=Gwau7vdn8bNdOjkOq1ZZ7U2D6iPJw8HjnsFC1isZ3LPV9QfV132uLg2NUwOC5c6SF+Ie
	 FHgTOgJ5OnFZmliJUtEsxsRIH9j1wTLnIwXbk197Wv+ecldANO8R67TxZ4Y/sRFTv5LAr
	 tI/JorZ0eEwbcYbTUoBzFtgXIC5nwV0rQ4Y0/ZDPCerAkIGFEUFlN1HEbjenC4uhxjV4f
	 sG1ORzF3mzq2Zc7dFs1cWqOUZQD+cQ4tSy9iZx7wiMCzhhe9KndOoOdZv+d8svXnFoP/A
	 6Gf88NunMDTg3b2Eveys9+rMYRf2EwZBNBJ7v18Lcq2gADhBnSCoRNoeeUeMuOBFzyw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=LRCtO0p1;
	dmarc=pass header.from=9elements.com;
	spf=pass smtp.mailfrom=9elements.com;
	arc=none smtp.remote-ip=74.125.228.91
Received: from mail-ed2-f27.google.com (mail-ed2-f27.google.com [74.125.228.91])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 486D91F000FF
	for <tools@kernel.org>; Wed, 16 Sep 2026 08:43:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=LRCtO0p1
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 486D91F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=9elements.com
Received: by mail-ed2-f27.google.com with SMTP id 4fb4d7f45d1cf-6aa135d6e97so1004427a12.2
        for <tools@kernel.org>; Wed, 16 Sep 2026 01:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1789548201; x=1790153001; darn=kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QEbGpmw69znx0BrzK0qohQ0axjwSqcP/PmhoDr48RLw=;
        b=LRCtO0p1I+OIYGA2v3FsMZengq5tkyJngKNDuh84U/UScPulBD22cz9WUlzsAjGiUM
         PObYx7WFGT92WkM9+0p5HCCxRLpSo0wm8z17N8MvokLIdEd8vvje0jYArb2jff22L9wn
         QReP4GZoCBWiMho3X5Nli6zhfjzQZcAgvRAKHt1R3lUACev8zHPXury0vDGFAgA7tfb/
         xCcx/mFg1mPJ5iLva5/ab179hzXXzF4Mxcpklg1UVxTdalhaC428r+R4BpD3T/CaRAOI
         mgYmPGWbVdX/HSJkq333bc7SvPzk8yYfx8g6Y/tycQ2bnEVbMG4ghejcZZGh2GVaM3SR
         5HSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789548201; x=1790153001;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QEbGpmw69znx0BrzK0qohQ0axjwSqcP/PmhoDr48RLw=;
        b=DeLU7/3/2umtRLe/QmK9CzpGEQlAVnqSaWgqtUQrkSZxxRpPs9AtVXu1FPW+E2E8qy
         iUIyaVf5bu8MX2U43aUDLOxPYHB7cGv/VA0jWsfj4XxEZK2wa/hT3kglyTQEaNmyjvxg
         FwhqkxTov5yaH1LO93/ivz3rvxTfma9ufSqnFFRn9hoW/1pMqu+b666v22w3HIuB7vw8
         0k+iP2kpfSTfb+VC75l8jgca0sswnQxBN7odNOvlmM/rEorr3C6/XBdUdja76nlLdpC2
         PfnM3Lw95TdvakQoul87xX+juXfwwYoz064UTfsWyNm+ssju9MzcpuSHu1WsY+WHkoib
         uFfQ==
X-Gm-Message-State: AFuF++nghc9UDJ0ratK8P6majNKZfnv90wh0EQMbzPrbg+E5rlY6K57s
	qxVxqdq667oZ2dSUkZuuoOdp/A4r1HLwz3/5Jwn9iQ2PyRXlW/UeJl4VraP3YlyoBFs=
X-Gm-Gg: AYBFou3D2ljqfHrWi2sGCxSe+gQB4Aj0IBNfaY+Uo4d6TRKkVhpNAm6e7fQOwkAPqFs
	xV8a+yS3Zl0JmX3By2BvDOMY6Sqe2HQAguj5/s3jRnKfADwX50aqskcwp5PzTWDNhEI0a8AZvIp
	GvWX35oPrrjCvgUEI1PxVhoDLLZRrnfB0os/3h387leNXbtv+IXDO6DWkMEdnBq6oGIvrDfhkUm
	ctf5XZxOCyAPhSDtPH/2U5EBkFTQC28bzAkdy9eGubOFGMtwdA95lr0O74awe2rPNaFfALrxyGI
	+lf8jDXq69AA0D/2T1k3Vb6KZaLa/iJq54W2MEIzaY/ooWjlhFZZF62K2IVERoWPPXqH93+zxu3
	cEiRIcjwEYL7XAMr8M+6w39+H7CkJTD6TiBv80jvbly3hCCr0PHrX0XacVWAlwPUCWg+PI5K4VQ
	v/Pcy2ov3Rz+BVgG0xRD84lIHPepBIlRyKqhxTkhabgjVQOxUPvvK6ASVkU66B3NaqrBTifhR0Y
	sQHt2QGPeycwzA=
X-Received: by 2002:a05:6402:52c4:b0:6a3:ff14:ebc9 with SMTP id 4fb4d7f45d1cf-6aa22402ed1mr2297118a12.11.1789548201602;
        Wed, 16 Sep 2026 01:43:21 -0700 (PDT)
Received: from white-mocha.local ([195.169.148.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d228de9sm1243581a12.6.2026.09.16.01.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 01:43:21 -0700 (PDT)
From: Tan Siewert <tan.siewert@9elements.com>
Date: Wed, 16 Sep 2026 10:43:07 +0200
Subject: [PATCH RESEND b4] shell: copy zshenv and zprofile if it is zsh
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-zshenv-v1-1-fea07ec9c2db@9elements.com>
To: tools@kernel.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tan Siewert <tan.siewert@9elements.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789548193; l=2177;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=3zZOzIOCPaPSyxlDuRgsJstq1ECS6nWcz2tDTVDR/hI=;
 b=MtZMDl3bX1et8LWGLe5GrwkeWkvhGQsWsgdhVe4mJ3mEhSEi06Bq2qV5rKwVv9x7yG3T5TVIY
 94f0ezc1dyFBDD7PBuH5UjS7rpVJPu8vn7E5UmFdyIDirff5M1p3054
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=

ZDOTDIR gets overwritten to a temporary directory that has a generated
zshrc, based on the original file from ZDOTDIR.
According to zshall(1), zsh also reads .zshenv and .zprofile from ZDOTDIR
before .zshrc.

On NixOS / home-manager, a "$ZSH" variable is being set in .zshenv that
points to the script directory in the Nix store, which is then being
used by .zshrc. As the previous mentioned files are not being copied,
the shell is broken:

    ---
    You are now in shell mode. You can execute git commands or run checks.
    Cosmetic commit edits (reword subjects, fix trailers) are fine;
    b4 will reconcile tracking data when you return.
    Do NOT add, remove, squash, or reorder commits.
    When done, Ctrl-d to return to review UI.
    ---
    /home/sinuscosinustan/.zshrc:source:26: no such file or directory:
    /oh-my-zsh.sh
    (b4) ->  linux $(git_prompt_info)

Copy .zshenv as well as .zprofile into the temporary ZDOTDIR if they
exist to avoid a broeken shell.

Signed-off-by: Tan Siewert <tan.siewert@9elements.com>
---
 src/b4/__init__.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index d140757..c71564b 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -6339,6 +6339,13 @@ def _suspend_to_shell(
     elif shellname == 'zsh':
         real_zdotdir = os.environ.get('ZDOTDIR', os.path.expanduser('~'))
         with tempfile.TemporaryDirectory(prefix='b4-shell-') as tmpdir:
+            for zdotfile in ['.zshenv', '.zprofile']:
+                try:
+                    zfile = os.path.join(real_zdotdir, zdotfile)
+                    shutil.copy(zfile, tmpdir)
+                except FileNotFoundError:
+                    logger.debug('%s not found, ignoring', zdotfile)
+
             zshrc = os.path.join(tmpdir, '.zshrc')
             with open(zshrc, 'w') as f:
                 f.write(f'ZDOTDIR="{real_zdotdir}"\n')

---
base-commit: 1f2f768cfa57721bbc235451dbf0a777b876945f
change-id: 20260819-zshenv-c80b5520e48b

Best regards,
--
Tan Siewert <tan.siewert@9elements.com>
-- 
Tan Siewert <tan.siewert@9elements.com>

