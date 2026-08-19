Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F7142A96
	for <tools@linux.kernel.org>; Wed, 19 Aug 2026 20:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787170611; cv=pass; b=LeNLkwCAQAKOvcWa0AZdExh6ZSLONpk8nwIQ0Zr6OusTpcP8JVxGTjgPidssxR5+S45PS1ffHgL1IweaKE4Rlv17rrwaUpVIp/vuLGRC0px/nLxgWVLcKt0t+bsQrQJEtDRLiHV2yODwJlTx7yiRYjO/PguMXHXH+9eSJGHn/bM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787170611; c=relaxed/simple;
	bh=PM6lPT8ASL+JhUUq+c3IYoRs2P6ygVQBurJDkjFWGtU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uL2ABFMug0ZvGeoSTSzxlrjx9me/u7nej+LyYkOuQEECiD10tyuf24kMbNh5W4oCYHCKhefhcT6uWPx5tWN7BGsPiB8JgjHNMiluUHmr9A23PJygtB+BOKtY05VUilf0Rszlw24pckQYKX9XILmr+j/ZLGoZ6AzdMFRnakwSyz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=QqZbcS7Y; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="QqZbcS7Y"
Received: by smtp.kernel.org (Postfix)
	id 1F2EF1F00A3A; Wed, 19 Aug 2026 20:16:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1787170610;
	b=lEqJvUNCCiFDFQGiRMOGLPOtTU/TjjRyvtu091PvJEHGyKn0/brcmAzVVVZC4RBGsnmA
	 /mcCf9bJOf0Vv856GjmtA9wKQ/YZ2EJ3uf+Qb4oHyjEkGJiaSwot1soTdIMW9UzNh7iFO
	 qpKZnkNO7aIDfWooICfuRFJIxPzvdzKDJCkJiquIk66jdUQn6qnN3jnU1qKXgbJN7TKDF
	 lhSPWHlJKaNpKOi0GKjaITd9WGvDcGhRswNHConqqm/6YQ79jn72V0WX2KyQoObI9Hxgl
	 51AdboXf6jZqj8zSDSo87+RnWCiibwFfyv5AbI3ZyOKaWFAPBKWVkBwCMDdk2TezuXg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787170610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=NMEsr6gl0xCiPcX1n9c7JUwuChfjdPfCulsTYOXnPjI=;
	b=tc1g7ImwmeowSFWZUZmB2FM3vjxjMIujTy1Htb3ywfzE79fvtXjug3QdWbaRwm4LhSTq
	 4QSq/7AQy8tYSJ5+yP/q6JDCYGq18BSI1s50xxLDvEAxXAvBJWcypKRTlkDJwYIRh1ecs
	 KWGjuI7QQvneicYTkt4NjglhSuY5plMNPp6DWcFzkyM+iQN/86HSl0z/J1yh9Cra+z+rI
	 fQNyzxZmwWDSAb1Kc+E6ZgSFsB0e2Wj+Ox25VJRi3x9AWsTkmDLp6QBvKsBSuRIgIxnFK
	 Pvx+WEKPDoacsvMUmGVGiFtaKBsOBnXFeNU1VzoA5YhDghzj81uSYbZ6Y7QTSWoHeDg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=QqZbcS7Y;
	dmarc=pass header.from=9elements.com;
	spf=pass smtp.mailfrom=9elements.com;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 17B381F000E9
	for <tools@kernel.org>; Wed, 19 Aug 2026 20:16:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=QqZbcS7Y
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 17B381F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=9elements.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so13788005e9.0
        for <tools@kernel.org>; Wed, 19 Aug 2026 13:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787170607; x=1787775407; darn=kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NMEsr6gl0xCiPcX1n9c7JUwuChfjdPfCulsTYOXnPjI=;
        b=QqZbcS7YSLLM9wxD5z6ZbsWw2Hl3lo9bv9olXxC5sEpzTnXvAs5WaOUCQVcqf5mXGn
         TcDDmWCFE5mi7+WYz1ER3bSHOlhv+ts1VElH0SgCPKxR0mOi63VM9K9jhcPIrhNJJFTd
         ULQm1P0GIn4s40XgmFKL+1APIir3I3P/CJR7/AVXA/L8V3eiZMtru4fyK0cum0z9NDfm
         rXIax3xqckoQML+3OVeXaY2f0R93DzqZLV7/hT03+p+nM4Gn6PG37yrG/d3lj0J/HsVs
         eokujnb0Zw9Dlv9nu/7ZfKB9UEoN07hmW37ruO6WRk/lewvN6/dMM8WcOAlaTe3ucO7p
         KUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787170607; x=1787775407;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NMEsr6gl0xCiPcX1n9c7JUwuChfjdPfCulsTYOXnPjI=;
        b=XqY4Pa2A/NU/I++f+dBYP1bm1NoPdzONdxNvUCkTT6G2sXm2vPN9rIYl6xsovfsms9
         eAK1Fz3LWveOTleadJwNwJPjC7W7Ist6/vJ8DDtOofS4qqoXO6OUas5ihI5vKb0tU1sv
         9oG8nqoa6+yFiYXJdSvy2q9mqnJWDi2P1puQgyzTo8tqc/2/6THpG48Jrl4lO2UGOvQt
         Z4LCJlY0qpFc315I7kj/i1zGTZUBSybtgC/RqZpVOGT6XLN8leQaZ4OKraoJlMKgYsvF
         6ZDmqhHBTXRlNFRpWLJX1EARjUPfLbNjMKsOS4whkr+s13stLpmdruWJE4I//ugM4T1f
         rjJQ==
X-Gm-Message-State: AOJu0YwuxR4PnO/KE9druym2PrUvtnCJqL2QQHYOzv9N1ulll4FA0Kz8
	JWxMDkDCOvv1YonETh5nO1D/m+GuoMsQFdwF5h7mcO/Qr3Ke90wvoCMl5RJRFBAXFHoMAE5++Fb
	rGxf3E9U=
X-Gm-Gg: AR+sD12Yen7K+Q8sFWSpR8frdKdaKYd07YlwMuVIP5NmSeHXFC27bbHbVbhsicfJqsW
	IvteEzFC4NgOdOyrjuYWNPT09QGAtLhstUdM0cYIpgcdjjCOIfaz+D8MGy2yzWGHDAJ9ts6g6YZ
	8zrsUmE4QfJtDVc9qd+P+TO9aqHQIusvYdHelUkMPekRXE3OnGsomOAVt13fGTqqDB5qLYZiIFE
	J0qyGvIivvwYuhKF+BYDdg7e8PStg5s121o4j1GUERs9i0mHvFBj1bojebN/AjQMu9tmab1LtU6
	wjaK4Ifht2rDIbp6h+EszLznUsukU8dZxLdBZ/z07wXCPgdtkV/Nyen1WzJYqK3Mox3sxF92phG
	CFFFxf9he2LoNCkjQrNZD2vThJ02hwPQdVMhik92o+X0jG/1zzWQmubcaXmeBtN7bkbIINRWt7q
	vKz5RruhXirPezeRo+RJ2PBeKrTuzSSxelNKL0H5JB0a4K5yk4bwiVdjDoyjmFEd00Tb4jfjrh/
	ajDAbgT+ZI4oaoN2xFJxZFA01LNeDI81iPdmq0rsuI3m7dGrmIoX6Sxm3ri
X-Received: by 2002:a05:600c:3593:b0:499:841c:2016 with SMTP id 5b1f17b1804b1-499aa0ff5a0mr158240185e9.0.1787170607169;
        Wed, 19 Aug 2026 13:16:47 -0700 (PDT)
Received: from [10.0.5.39] (p200300e66714e500bfe47b00fa11e276.dip0.t-ipconnect.de. [2003:e6:6714:e500:bfe4:7b00:fa11:e276])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9e0eee0sm62916255e9.4.2026.08.19.13.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 13:16:46 -0700 (PDT)
From: Tan Siewert <tan.siewert@9elements.com>
Date: Wed, 19 Aug 2026 22:16:45 +0200
Subject: [PATCH b4] shell: copy zshenv and zprofile if it is zsh
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-zshenv-v1-1-989a50067ed4@9elements.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQqDMBQFryJv3UAMKrFXkS5M+tXvIpV8FVG8u
 7EuZxjmgFBkEryzA5FWFv6FBPkrgx/a0JPib2IYbSpt81rtMlBYlbfalaXRVFiHFE+ROt7+owa
 uwOdxsriR/HwfcJ4XAzeMdW4AAAA=
X-Change-ID: 20260819-zshenv-c80b5520e48b
To: tools@kernel.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tan Siewert <tan.siewert@9elements.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787170606; l=2133;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=PM6lPT8ASL+JhUUq+c3IYoRs2P6ygVQBurJDkjFWGtU=;
 b=n7Cq8k4DvvC3Ps8qnnc5PlJbvE9oh7wxlQGreYzvpsdlQDCkhTBb0crO9Y2vhKgGLsW0yf57g
 q2SxuMdVEIxBGtGlodsQ96xp2fHS8LhwWLCh0+VlgxRnc5IGAbUXdkv
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

