Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E18231A23
	for <tools@linux.kernel.org>; Mon,  3 Mar 2025 16:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741018864; cv=none; b=tUMZCoNEGghWc8oQqh/6ocgg4ahSg/Dei7JES3Tur49M1dmYiXJffJ6Ds1pbHpn+i6JyN6OLrLs3aKOQhfj4v/Qd6HgkmZkfQ5O0vhP3KxanJ726SMSANa4Bifwc3fwnViA0/ajtJAhWbRB+TZnSFyKs8QQAtM6Sqpbg2rbJY6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741018864; c=relaxed/simple;
	bh=vbocRQEr6ucvL2wXcyf/Q4ydkQclsGnw3OlbUg8DyWI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LzlRUn5MhBX3JJHcc4nkh92st6dLX7zPcQdk+Aqa7cjm2nRkBw9VV59bIQ2qB5W+tk2zmO5+egk5uM3XzV/fa6z78PkS4PJh+E/WUb6uSS6cfYLg/JLWkYNNSILqMz3ypv9KBgml+R5vizZiBb9zV9jmlGowYb1eEV1pNXXDS5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NAnXVvlP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=v+lVIvhT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NAnXVvlP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="v+lVIvhT"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741018858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=oJycAV5ov3F+piXrIA7pUtkrElpuwLxJftxSrz160rQ=;
	b=NAnXVvlP+Pax7Zg6AVlP0YL7feE/6LjYjCpgixDDDYJKIYxcnz1R9aNY7P1m15IjJcAD1n
	QyobHXiaq8cCL/28EVwIt1dVeBGqQtZZDB1ZSZlhlGUaqet8YECAyi+YWpPhxLlR/QRrQf
	u5FI5BsKSBhHnVxNufd8YMqidJx5bgMbY0BuVTW+gDTn8WWNah7uoxY6MNVo3lwsejcJNs
	NiaQhjT3WdC1hA6/u6beYPznsIcApHh/SaPAEUrYXkmpQGs9flPuiuojMbyFX+ZFl4FftX
	tS6TBN58oCQznDpBJr/xg5znyCdxBLJ4lLJv+ykU8T4drOhfrY4WYGHc+Gz2hQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741018858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=oJycAV5ov3F+piXrIA7pUtkrElpuwLxJftxSrz160rQ=;
	b=v+lVIvhTJq1/qVoBmq79T25WRGG6pvrm2bIw3QUxHmh/tpGSr03JuJpBLRfKajm3z8WPPR
	Lv/mBN20c+4OIFBw==
To: tools@linux.kernel.org
Cc: Konstantin Ryabitsev <mricon@kernel.org>
Subject: [PATCH b4] Handle author A, submitter B, committer A SOB chain
 correctly
Date: Mon, 03 Mar 2025 17:20:57 +0100
Message-ID: <875xkqccgm.ffs@tglx>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The trailer handling of b4 fails to handle one particular case
correctly:

Dev A posts a patch with his SOB

        Subject: [PATCH] subsys: Something
        From: Dev A <deva@k.org>

          Some explanation

          Signed-off-by: Dev A <deva@k.org>

Dev B picks the patch up, adds his SOB and reposts it in a follow up
series:

        Subject: [PATCH v2 1/5] subsys: Something
        From: Dev B <devb@k.org>

          From: Dev A <deva@k.org>
          
          Some explanation

          Signed-off-by: Dev A <deva@k.org>
          Signed-off-by: Dev B <devb@k.org>

Now Dev A who is also the maintainer picks the series up and b4 converts
it to:

        Author: Dev A <deva@k.org>

          subsys: Something

          Some explanation

          Signed-off-by: Dev B <devb@k.org>
          Signed-off-by: Dev A <deva@k.org>

While Dev A is correctly assigned to be the author of the commit, the
SOB chain is incorrect because the first SOB is not the author's
SOB. The correct resolution for this is:

        Author: Dev A <deva@k.org>

          subsys: Something

          Some explanation

          Signed-off-by: Dev A <deva@k.org>
          Signed-off-by: Dev B <devb@k.org>
          Signed-off-by: Dev A <deva@k.org>

Validate that the committers SOB is the last one in the SOB chain and
only remove it from processing if that's true. If the committers SOB is
before the last SOB in the submission, then keep the ordering intact and
add an extra committer SOB at the end.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 src/b4/__init__.py |   17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -2205,9 +2205,22 @@ MAILMAP_INFO = dict()
         sobtr = LoreTrailer()
         hasmysob = False
         if sobtr in btrailers:
+
+            found = False
+            last = True
+            for bltr in btrailers:
+                if not found:
+                    found = bltr == sobtr
+                else:
+                    if bltr.lname == 'signed-off-by':
+                        last = False
+                        break
+
             # Our own signoff always moves to the bottom of all trailers
-            hasmysob = True
-            btrailers.remove(sobtr)
+            # if it is the last signoff in the chain.
+            if last:
+                hasmysob = True
+                btrailers.remove(sobtr)
 
         new_trailers = self.followup_trailers
         if extras:
