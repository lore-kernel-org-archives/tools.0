Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5EA4C81
	for <tools@linux.kernel.org>; Sat, 28 Mar 2026 23:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774740169; cv=none; b=MkH828g8hsXh5KTEhBUFrtISo35W7My1YCTYzYsNBVaLtkDU98XFVE7/vZYfFgZTXakhB1ntrjpZ4ZEJm08fGlMMXRTLDx4tDf3JtTIFTNCHDNEixUWHaXycOd/OX+42LHlwv0AobKHg49jbbIKWi8fMOEqGga2XdiA/VDcaEv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774740169; c=relaxed/simple;
	bh=GppUzbQ7wjn5QBMREIc2qg6vTNW9hY55ARtAu6MYkSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MRfhJ/EBn3PlFMuuziEVds9NZ0tNm0SvbaiiTTNnyMIrbprwCYj0a7nJQYMDpzvINLnpIPifHToBwExuXvaQ8h6xOpPuRDB9LL9tZYfyQrI9Grc2YNKR93HNiGLsks9J0I3TBRKYA5Fn61vx+qe0PeVcj7nAIj9RDSySWGGrU6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b=pqmR3W1Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b="pqmR3W1Z"
Received: by smtp.kernel.org (Postfix)
	id 81B64C2BC86; Sat, 28 Mar 2026 23:22:49 +0000 (UTC)
Received: from mail.envs.net (mail.envs.net [157.180.15.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6FF17C4CEF7
	for <tools@kernel.org>; Sat, 28 Mar 2026 23:22:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6FF17C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=envs.net
Received: from localhost (mail.envs.net [127.0.0.1])
	by mail.envs.net (Postfix) with ESMTP id A3A961C00C1;
	Sat, 28 Mar 2026 23:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=envs.net; s=modoboa;
	t=1774740165; bh=xioiBbwBH5sJG7UDREtPraWZGaJgFdthNp1++XQQvxU=;
	h=From:To:Cc:Subject:Date:From;
	b=pqmR3W1ZYQ+cT5MEflgakq37Yl7he8o0urWYxrdH/7hUH5b/85jbHuo4qeJ3yCT4H
	 6ZdL403A9LR2Enpl9XI75xv2MpuMyDtyTrsPCbeV1ROf7SCkqgR0xwJBanEy3USRWp
	 xwme6M0jiS2Lp84aOWc9NB5VdEOE+5RTTgy3BRy5BemnPbB+JnsIY+CLe2rjzYDFTl
	 EkJSksPS10lfhrP4rlCFbz265Ohr4S+bXKvYwu84/TKXOE1h8iGqLTDr/9yLW5vGoQ
	 bo9dDk54n5WIiskU4gFTMXyAt2BLOcH3BoK6szBbBrhQ2BMBagWtCk1CCaIos6yjo7
	 +xeVtuetgDi+i+xIpM85DZro1TosATAtphVcrve9sTAtbuPVfrSAXBTmGe8o51haG8
	 sqMcJNJW5HZHENJbuNgi4Lu3KlwENpbmmcPARBPn8cWgZsmso2Onq9FndgZatRdOAx
	 5mDly9z7JmPANlcCePQy+E+XM5PvbQv9XUw5S1ueFBKvC2poph20euTtXma+EbbnP7
	 HYW/UqdryDiyRqPYd4Qf+Q+rdp8TTsG0iS5AoTmk+UPU6NmOAoeuIaBglAaKLzNcLE
	 H0Rra9x+AV5fjFG+TIGHQH0iLR+u6vcxDoeMvLgA0jZW+9VFBTHg57K1HbVEpUneKa
	 OpqLrgzPkJxaqX2Zn8X3Nric=
X-Virus-Scanned: Debian amavisd-new at mail.envs.net
Received: from mail.envs.net ([127.0.0.1])
	by localhost (mail.envs.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id dnx8QYqLxnBb; Sat, 28 Mar 2026 23:22:43 +0000 (UTC)
Received: from xtexx.eu.org (139-162-51-66.ip.linodeusercontent.com [139.162.51.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.envs.net (Postfix) with ESMTPSA;
	Sat, 28 Mar 2026 23:22:43 +0000 (UTC)
From: Bingwu Zhang <xtex@envs.net>
To: "Kernel . org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Bingwu Zhang <xtex@astrafall.org>
Subject: [PATCH] Support SSH user.signingkey
Date: Sun, 29 Mar 2026 07:22:34 +0800
Message-ID: <20260328232233.57299-2-xtex@envs.net>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1774740153; l=1462; i=xtex@astrafall.org; h=from:subject; bh=B/GDFnoVB8OrhFk7qmn0Orn+G3G4xcEeGKitzk5E8HY=; b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgL1erbbl1jNM9AtzeLFJ5FKVqr/ylJ MBUj5+W9IwwCl4AAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA QDEtHefaq++96+rasGgzqSTU4LvQy+JMTtkADHFbpJHhgcs8ig1yK5mc/DpeQZYSobqJy20I0yB CzU0OoKmxpwg=
X-Developer-Key: i=xtex@astrafall.org; a=openssh; fpr=SHA256:IEYEjkZlkUTr5U9GiDAmZU/4eZus2t2RsxusyhQqwao
Content-Transfer-Encoding: 8bit

From: Bingwu Zhang <xtex@astrafall.org>

Check gpg.format to see if user.signingkey is a SSH
key.

Signed-off-by: Bingwu Zhang <xtex@astrafall.org>
---
 src/patatt/__init__.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/src/patatt/__init__.py b/src/patatt/__init__.py
index ae8f21ea104f..ac610b87bc6d 100644
--- a/src/patatt/__init__.py
+++ b/src/patatt/__init__.py
@@ -1312,10 +1312,13 @@ def get_algo_keydata(config: GitConfigType) -> Tuple[str, str]:
         return algo, keydata
 
     if not config.get('signingkey'):
-        if usercfg.get('signingkey'):
-            logger.info('N: Using pgp key %s defined by user.signingkey', usercfg.get('signingkey'))
+        user_signingkey = usercfg.get('signingkey')
+        if user_signingkey:
+            gpg_format = get_config_from_git(r'gpg\..*').get('format', 'gpg')
+            key_algo = 'openssh' if gpg_format == 'ssh' else 'openpgp'
+            logger.info('N: Using %s key %s defined by user.signingkey', key_algo, user_signingkey)
             logger.info('N: Override by setting patatt.signingkey')
-            config['signingkey'] = 'openpgp:%s' % usercfg.get('signingkey')
+            config['signingkey'] = '%s:%s' % (key_algo, user_signingkey)
         else:
             logger.critical('E: patatt.signingkey is not set')
             logger.critical('E: Perhaps you need to run genkey first?')

base-commit: d8ea60b65cad9b92003eef92153457736652e2bd
-- 
2.52.0

