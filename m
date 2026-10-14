Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821E9492E26
	for <tools@linux.kernel.org>; Wed, 14 Oct 2026 20:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792009244; cv=pass; b=rVn5BqNC2VmBjNEvTN7I03SyN/79YpgHPyRDE/QEHoT0dAMpOY5BOhgPQzGe/+sqLDvs07AWg0Y3DA24RcwkO1TTANLA/HboAzdh1WRBCoMVfdZZI1nniVzMdwkvyVYSnxbfidpMjgu7yuFX8xR86o11ImNwDIf9Tryed+SDH8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792009244; c=relaxed/simple;
	bh=vko5hU2sB61XujTMdYgx8NAFIi31tVeayOJTLVLz2+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 In-Reply-To:References; b=ktaK82SboPBFaEccgikpJYIxWXRK7GQvSgqOXPj6A6c47DYqMdiTYTHb6YREj4vkxWuhs+yZedJzahk6fu0YzJbds5OkecTQdo853uM4EvGlb7nDtHBsrKeqRAaqVa3zMvXGYBSsGUCrJKvEgQMvJnAdeGKNtHj6CxB1sxkifl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=jetm.me header.i=@jetm.me header.b=QPRjiRVj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Dbq5fmQn; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jetm.me header.i=@jetm.me header.b="QPRjiRVj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Dbq5fmQn"
Received: by smtp.kernel.org (Postfix)
	id 2C4561F000C6; Wed, 14 Oct 2026 20:20:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=202.12.124.149
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792009243;
	b=ff2mgY6iqM7FDlcmddxg0D62t4aFx5Vd0MaYr0p/GRdnLdx9OK8/jLCf4rK+irASMJfE
	 gKPH4fHB5J4F7isu4UEf97zNoTmEbZdLR5mV/zJbbe4A8um8owWla4qwrikoyVboKU1u2
	 r8aKUAkiuFgmBdI5PY4k/d7yI6cfXBTrcDWqYUjKpEp0L2t0FRik2DM9dlibLhj91+wKT
	 RiYIRbo3nhU+MsVbOlNsCBGSqGaWhTszQHIEiAKWMMl6ZiggVZ8/93xa7HW1MAdHklnnd
	 OTJD7ihZ1zYcteEEop3atKfu12LDJ9vFMJlbg0Ra5Cy/w654QjOTtiaCS1gFT4XBk5A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792009243;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 In-Reply-To:References;
	bh=uPLLdzLkwp3COqybr0FyeOnUqTRJfCPqqXKKBdJCVUI=;
	b=gTlwdUCQ89PkWqwCuhdg1OHfORqBdtd6q77JDOehJlyzEwA63l13RPe8/YC1IFHEKb6V
	 Afh9lODzKS2Pqfj/P93wo5b65h8TvScQq2ZXkQn6/qB9NfL23cVpXizMSJ0s3/xZRRSs2
	 uL1JXF5KJs4IYLSNPpjK5CbmAlqaw2o4HfOki4/HUgfYZrCQjhfgJmWxJZZUEAZDCVou1
	 kKglcgtljL/E/aZ43o0EnRq8KHvgj5124qR2uq2XjIG/bW3yEWbZglOe243MY4PQ+mObn
	 evDa5xjURP0+SktjZtCJEEM7P2+R/khVblL1WA3aUqZMC9J706iSypajC9ed7rd81Eg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=jetm.me header.i=@jetm.me header.a=rsa-sha256 header.s=fm1 header.b=QPRjiRVj;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Dbq5fmQn;
	dmarc=pass header.from=jetm.me;
	spf=pass smtp.mailfrom=jetm.me;
	arc=none smtp.remote-ip=202.12.124.149
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5373B1F000C5
	for <tools@kernel.org>; Wed, 14 Oct 2026 20:20:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jetm.me header.i=@jetm.me header.a=rsa-sha256 header.s=fm1 header.b=QPRjiRVj;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Dbq5fmQn
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 5373B1F000C5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jetm.me
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=jetm.me
Received: from stl-compute-03.internal (stl-compute-03.internal [10.204.2.63])
	by mailfout.stl.internal (Postfix) with ESMTP id C10D61D00071
	for <tools@kernel.org>; Wed, 14 Oct 2026 16:20:41 -0400 (EDT)
Received: from stl-imap-04 ([10.204.2.95])
  by stl-compute-03.internal (MEProxy); Wed, 14 Oct 2026 16:20:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792009241;
	 x=1792095641; bh=uPLLdzLkwp3COqybr0FyeOnUqTRJfCPqqXKKBdJCVUI=; b=
	QPRjiRVjFsDPrPFXfthSPGWRHo6wO8ik6miSdgnb6dOkdPr22smP9Eb3HvMUGOaF
	q1wcqvlP3hdRmQ6/tY3Nr/vZRbOn3xjPTBpQWufirOjlzY/ci9l2L31P9znadm+K
	rW4EDd0RAVw7tlVzfm89kRKWW9YpotgpYOhe/S5QTYFo/+DDvPStd8MYdPyoKqaE
	VMKgOVLDFdDuiT2kThqpe2+Nd0ZOJT2CepD2MsbaETCkDz6Q4u+Iu1B1q7JBxcEt
	L5BJd+zxmZbMTWFnDTcFUXmnJ7iNNX+nNPT/vwqn1cKK/KIYqig6s8a5678J98OJ
	fqCmr5OY+hZVY+2565twsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792009241; x=
	1792095641; bh=uPLLdzLkwp3COqybr0FyeOnUqTRJfCPqqXKKBdJCVUI=; b=D
	bq5fmQn5BOJpl8t3jY0zUWlJx86Wi/d70MP9vziE9yA+xaJ5wW+ceas2xF8CqZQH
	9E9bKVEAmDDMhFJMEUWhew9x516H1E7HG1Yxthe6k5ffbG7UMlyajVNRoCigNBHq
	LQNNndiWSP7mQ5ch0NUWOFm1eCGWbV4OXruuZixROjGXnmafdKa94LQXunKWo88D
	ZfV1n1FwUMEdgSeFZA+R3Ns2ARQuOui91OA+CrS07DK+SEc581XDsCOdL5Y9TKZG
	DlzMc/kp+JW/z+o6nfe69F8quB57mDyCOjkXZrWZWQK2++NgxvdvL3K2GCL0dgn+
	GGJMisOFR8zfESIlbaGwg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=jetm.me a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792009241; d=jetm.me;
	mf=PGZsb3NzQGpldG0ubWU+; rt=PHRvb2xzQGtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:QjnMMcYvqXUuECNJNPpntYFGc6qDMiY8+LXvCH64DP22QO/
	N6Y52ulalEnQlvmazzPNChaxYjat5dYum/yu+RHb0a3e1K388c2Z/VS3u7X9ewub
	KSzwGoWFjsQUg1S0QOim4WI5q6LAOBPKpGhJeqM28D+fuhf5xFjTwVP1wrdy4axW
	g2919GOoSvUR+BcR0Il87lyPQHj1J4/ClPSsWP3hUrbK+2XoxcoLJDBPuubeIaGz
	KrCTlH0eQJoSosFi9sxUfRBT4TyNr0OdKifbtDefLoS7rVfoF1vrDZPqP6e4B4sB
	MxPtdFaZ9f1M4cwNZbRKpEDgim4LnHElD+cCSeA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:FUglorO8fDH5YfU7FC9YYkLiXEqEFFrgTJb7/QLGnrU=:vko5hU2sB61XujTMdYgx8NAFIi31tVeayOJTLVLz2+A=;
X-ME-Sender: <xms:GeTPai8H5JUPJI2arNqNbyAsMGghcxABwJtmGtw18GsQt6-8s0eMKw>
    <xme:GeTPatgcbu312giGMdpiJb-36W9Hi70DRcDqWn7AYiOwin_T_PpGQJZwz38xQruZs
    Q21iH8nrVca-m4MvmpoqgJSDwJIjJ6FYlAXcy-vBFnILasIy2o2Tg>
X-ME-Proxy-Cause: dmFkZTEWNXYd16x1e2Q6+rD0s/rdwC8aJoS2UJKXkHNcq4n6YOgQjA7IW5CVBJPbGkp1YI
    VtlpD4v6b/CP0NWv7qRMEXmj1GTsFNu+mO3/TGaSPfK9vFVQjmDSsMbn9fBzyAv9K/5QL8
    LesBenwkFCzfSWmyooSkSmCatzazWaMZ2RxobITEf1onHldffH/CYbh5B5pAUkqqn7deqH
    nJH1Huv3Ds5gox3MySJgHRs2Sxo3KYD0qJrG7v/nLlCiKYZwfna3wH4fRRnCp1J8VuZcPs
    Ca3kXXmpyddWIwol3whMOoj9Xp+iW8crBeY52tFIONtx2SykNWeP5D9/FY/ihsTnriTShK
    fYrKnUn9FuNu17mbQGHUb0gpmxkpUu6EXXgtrBvtKQEtNcET2+uNtPvu3ejmIGex/rxwxb
    JRulu+xEADJASEDwc8ConyoJunI1pmeomtpNmKChcOCO68ttWR29CWTh/moUqdkucYZhgh
    Xgc6jQdilXeOzr/ktBQM/w10KlxxcXibAGWfC5myQUGQFp2oZEvACbdUMhQgB1GQdK6e4y
    QaigZDXCh1tXUvJJ0qnqr3FKKr26rqm9vAwJtgtfe6EIJLBc3JTs6++X1zkczlD/3eCu9R
    1jCRCdHv/xLg5W1REfIXHhil7mnX0E08TRcHMqRbOf6linYZKp/IFlcqVHkQ
X-ME-Proxy: <xmx:GeTPau_FFnt7ntQGwcY75MS4Jf_kqmJliwGI81adajVuz6_SSadhwQ>
    <xmx:GeTPakugbnHHzu3D3i8TI2IPt01p6fBasxeN8Rm2AdTegGgeX4LaUA>
    <xmx:GeTPahqYirOlkioed5kBpEno844U7AYxqXGNzpxQFFGmA4BoZboxrw>
    <xmx:GeTPahlofOLN9JeIWb-T8L6OWcBLMdvfDCmydFcfYChd4N2X9nMEjQ>
    <xmx:GeTPanSdZG5FllRP1Af1mx-P00gPg-2xgss_ZraM_j8pJjgMRnXz4h3M>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 63C6D8006D; Wed, 14 Oct 2026 16:20:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Wed, 14 Oct 2026 14:20:37 -0600
Subject: [PATCH kgl 2/3] Make _atomic_write durable across a crash
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-fix-feed-state-corruption-v2-v1-2-41bb71ddc15a@jetm.me>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7414; i=floss@jetm.me;
 h=from:subject:message-id; bh=vko5hU2sB61XujTMdYgx8NAFIi31tVeayOJTLVLz2+A=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBqz+QTdaO+eIbq7fIk6r1Z/zc6XGQhT3uZElnC3
 XFTDpWxaYeJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCas/kEwAKCRC17sMLqGd3
 H28MC/0RjqRz+7F9deb6bKwcR7XQWr3GHFyJXNVRAX9Ay77ybBMi+J/lvEpmG4M6IhCtOcYUGLA
 VCxekb/LBKHXI8B7SzrW/qYqG5G/nql/R9qAFPdv4zvVmoPxDZUX21MlmQv+BsFTzmuz++1w8qh
 PufqqxBJzFoE08jnTv6c96ncdR44BPTTzd9GDdD8l27B64Eccb3p3AJ3IsYlzUxzMysebY+9ccE
 mTZaBBqwKQtMtsz9nm6e5FRfvuN3j9c2Ky0H0qfx87Xt1kOVgDBD9uRFqKOG8gdQtuKbog2F3kG
 1+C7BiJwFwcyopUC8f4Jy0D6YApRU5e0kZkWL+LXEJnScxzeTcXCFrP8jeIet5oWJMNCmeqBkS/
 u13IBtkqHnGy5HxCKCdc9r1wbaJW/bnK8cvg6voDWOoK2fzrCHhY1xziQGRY0sxQZn+YeWKS5EY
 ETdZwIOpgqr56ap9TausvvcM1xk/Tp6vUVbl/1Mjpk9woyhZ9pQnAdUE76RzN6h7Y2fGU=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20261014-fix-feed-state-corruption-v2-v1-0-41bb71ddc15a@jetm.me>
References: <20261014-fix-feed-state-corruption-v2-v1-0-41bb71ddc15a@jetm.me>

The previous commit makes a corrupt feed state file recoverable, but
_atomic_write() is also how it can become corrupt in the first place:
it writes to a temp file and renames it over the target, which
prevents a caller from ever observing a partially-written file, but
says nothing about what's actually durable on disk if the host goes
down right after. The write to the temp file's fd and the rename both
reach the page cache without ever being flushed, so an unclean
shutdown can drop the unwritten data while the already-journaled
rename still lands - leaving a file at the final path that reads back
as empty or truncated, exactly what prompted the previous commit.

Flush and fsync the temp file before renaming it into place. The
directory entry also needs fsyncing afterward so the rename itself is
durable, but that step runs after the main try/except rather than
inside it: a caller like mark_successful_delivery() treats any
exception from this function as "the write failed, retry", and
deliver_commit() falls back to mark_failed_delivery() on exactly that
signal. Raising over a directory-fsync failure once the rename has
already landed would make such a caller retry - and in that caller's
case, re-deliver - a write that already succeeded. The directory
fsync is also the narrower of the two risks (it only hardens the
rename against a crash, where the write-fsync above prevents outright
data loss), so a failure there is logged and otherwise swallowed
rather than reported as a failed write.

_atomic_write() runs once per delivered message, so a mount that
always rejects a directory fsync (some FUSE/CIFS configurations do)
would otherwise log once per message during a large backfill. Track
which directories have already warned and drop later repeats for the
same directory to debug.

This adds a content fsync and a directory fsync to every delivered
message, not just every feed-state save - for a remote target the
network latency already dwarfs it, and for a local maildir backfill
it's a small, bounded cost worth paying for the durability.

Signed-off-by: Javier Tia <floss@jetm.me>
---
 src/korgalore/pi_feed.py | 26 +++++++++++++++++++++++++
 tests/test_pi_feed.py    | 50 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/src/korgalore/pi_feed.py b/src/korgalore/pi_feed.py
index cfce185..7754a1b 100644
--- a/src/korgalore/pi_feed.py
+++ b/src/korgalore/pi_feed.py
@@ -21,6 +21,10 @@ COMMIT_SUBJECT_CACHE: dict[str, str] = {}
 LOCKED_FEEDS: dict[str, Any] = {}
 # We retry failed deliveries for 5 days and then give up
 RETRY_FAILED_INTERVAL = 5 * 24 * 60 * 60  # 5 days in seconds
+# Directories we've already logged a directory-fsync failure for, so a mount
+# that always rejects it (e.g. some FUSE/CIFS configs) warns once instead of
+# once per delivered message.
+DIR_FSYNC_WARNED: set[Path] = set()
 
 
 class PIFeed:
@@ -76,6 +80,10 @@ class PIFeed:
         try:
             with os.fdopen(fd, 'w') as f:
                 f.write(content)
+                # Flush to disk before the rename, or a crash can leave
+                # filepath empty despite the rename itself being atomic.
+                f.flush()
+                os.fsync(f.fileno())
             tmp_path.replace(filepath)
         except Exception:
             # Clean up temp file on error
@@ -83,6 +91,24 @@ class PIFeed:
                 tmp_path.unlink()
             raise
 
+        # Outside the try above: the rename has already landed, so a
+        # directory-fsync failure here must not be reported as a failed
+        # write. A caller like mark_successful_delivery() treats any
+        # exception from this function as "retry the write", which would
+        # re-deliver a message that already went out.
+        try:
+            dir_fd = os.open(dirpath, os.O_RDONLY)
+            try:
+                os.fsync(dir_fd)
+            finally:
+                os.close(dir_fd)
+        except OSError as e:
+            if dirpath in DIR_FSYNC_WARNED:
+                logger.debug('Could not fsync directory %s after writing %s: %s', dirpath, filepath, e)
+            else:
+                DIR_FSYNC_WARNED.add(dirpath)
+                logger.warning('Could not fsync directory %s after writing %s: %s', dirpath, filepath, e)
+
     def get_gitdir(self, epoch: int) -> Path:
         """Return the path to the git directory for a specific epoch."""
         return self.feed_dir / 'git' / f'{epoch}.git'
diff --git a/tests/test_pi_feed.py b/tests/test_pi_feed.py
index 2082e49..433fefa 100644
--- a/tests/test_pi_feed.py
+++ b/tests/test_pi_feed.py
@@ -10,6 +10,7 @@ The git-backed parts of PIFeed are tested in test_pi_feed_git.py.
 """
 
 import json
+import os
 import subprocess
 import sys
 from collections.abc import Generator
@@ -61,6 +62,55 @@ def held_lock(temp_feed_dir: Path) -> Generator[None, None, None]:
         holder.communicate('')
 
 
+class TestAtomicWrite:
+    """_atomic_write()'s directory fsync hardens the rename against a crash,
+    a narrower risk than the content fsync before it, and must not be
+    reported as a write failure to the caller - a caller like
+    mark_successful_delivery() treats any exception here as "retry this",
+    which would re-deliver a message that already landed.
+    """
+
+    def test_dir_fsync_failure_does_not_raise(
+        self, mock_feed: PIFeed, temp_feed_dir: Path, caplog: pytest.LogCaptureFixture
+    ) -> None:
+        """A directory-fsync failure (e.g. EINVAL on some FUSE/NFS mount)
+        after the rename has already landed must not propagate - the
+        content is already safely at its final path by that point."""
+        target = temp_feed_dir / 'test.txt'
+        real_fsync = os.fsync
+        calls = {'n': 0}
+
+        def flaky_fsync(fd: int) -> None:
+            calls['n'] += 1
+            if calls['n'] == 2:  # 1st call is the content fsync, 2nd is the dir's
+                raise OSError(22, 'Simulated EINVAL on directory fsync')
+            real_fsync(fd)
+
+        with patch('os.fsync', side_effect=flaky_fsync):
+            mock_feed._atomic_write(target, 'hello world')
+
+        assert target.read_text() == 'hello world'
+        # Both fsyncs actually ran - this failed silently (nothing raised,
+        # for the wrong reason) when the dir-fsync code was deleted outright.
+        assert calls['n'] == 2
+        assert 'Could not fsync directory' in caplog.text
+
+    def test_content_fsync_failure_still_raises(self, mock_feed: PIFeed, temp_feed_dir: Path) -> None:
+        """Unlike the directory fsync, a failure flushing the content itself
+        happens before the rename, so the write genuinely did not land and
+        the caller must still see it as a failure."""
+        target = temp_feed_dir / 'test.txt'
+
+        with (
+            patch('os.fsync', side_effect=OSError(5, 'Simulated I/O error')),
+            pytest.raises(OSError, match='Simulated'),
+        ):
+            mock_feed._atomic_write(target, 'hello world')
+
+        assert not target.exists()
+        assert not list(temp_feed_dir.glob('.tmp_*'))
+
+
 class TestJSONLOperations:
     """Tests for JSONL file read/write operations."""
 

-- 
2.56.0

