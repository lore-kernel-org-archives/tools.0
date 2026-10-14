Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969E04A263D
	for <tools@linux.kernel.org>; Wed, 14 Oct 2026 20:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792009246; cv=pass; b=t5CeepLcNd7d6lg3iBqz0UBATPa6sEzbxyngAvInQ0by5Ha9eiNGy34w3pr9EtjOAw/fFC8rk8q6pkHFFwy431Ln1kNHMGapYK18JXv7bNpDKiA4HMD/kwdK1LgTbxFjiCV53SYGGSxapfcI86Szz83snUz0fscXmxV9AMQid1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792009246; c=relaxed/simple;
	bh=1sFC1pmNl0ZAnhimw8VLfRdPs/5VKAIln/rymIbF/sY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 In-Reply-To:References; b=QXNHIay6WroB42QU/z0D/ZevrXPdtSWKagTYP/8Gtn2fsf+kCfrsz9pT7jW3rSDGApOd4mkmY3XJSiaK8p+Gn3yM1q4RHHeRYHfuJOfWnTCqFuPrIBgqKlhA1UEymuQvDbUUP3UsvdspHuChGts5LA41iinnSNL5ZSGSMxhUAU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=jetm.me header.i=@jetm.me header.b=1rgTvRU2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OfdjG5iF; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jetm.me header.i=@jetm.me header.b="1rgTvRU2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OfdjG5iF"
Received: by smtp.kernel.org (Postfix)
	id 6173C1F000C4; Wed, 14 Oct 2026 20:20:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=202.12.124.158
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792009244;
	b=oHpw3yv9EvaZqU1Cq73TcnlSqQ20OaQAahlb3xHICjzUnyMALkmAXt+ZWTxpyeZ1TnZc
	 kN7hxNlK8KISvIF/KsG2baq+YVEpzwVAU4PMBjh00RkVk8hKsTd7je7dg3aZcjj3Qkblk
	 xwK10MfnqWaXfx4rq+qyUQRwo5ijnLSbMO9wtK8OP9cUqv2Mvanir7y0wdiCeDsA2yn1/
	 a/Ms3NrMTbXzFbrpGWTIdYj3AA7nTV2rqCb2MubC57fIXN8eiFdagCkpBF1Zs7ywRCATD
	 0ShookfnVYkjFgBDouUTehXIZRsmbMStNVr/LV9HTDa/3N+BQnuV4W0YHpvkcQQlR5A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792009244;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 In-Reply-To:References;
	bh=VW/lzRTo58wTE6X980o3QgpEFwCXd4DkLKsagJbYuCg=;
	b=oIbPepA+d9/8i8tjp7LOwD9bgJzCeALBfPu2F5CYsrEKh1xwTpJQiTyynu3cNOlnbu1I
	 GaqJEFrNyU1jMa1Hqt4ZoqGPg5CGHMLHJYud4r/YCeAaVAxZgZw6HruRcIV69LBKmGaWi
	 zeYnyxN092xcggThveM4amvmAIpASsn8udoYcHtkLhuzdbFrSItXSk8pAxdbAcLggQDUq
	 K37wXeACwuF74F3g6Wq4WYFmOMr1rjloQUCjhoQ6dVU0bnO+6J2S71pNwehcRVvdGtlcS
	 JfBZWwM7dS5UBcg17DJp9wzobhlQurrBbyeSHEF8GJAyKfKFP/4j21D9RIRy03faDmw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=jetm.me header.i=@jetm.me header.a=rsa-sha256 header.s=fm1 header.b=1rgTvRU2;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=OfdjG5iF;
	dmarc=pass header.from=jetm.me;
	spf=pass smtp.mailfrom=jetm.me;
	arc=none smtp.remote-ip=202.12.124.158
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 618891F000C5
	for <tools@kernel.org>; Wed, 14 Oct 2026 20:20:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jetm.me header.i=@jetm.me header.a=rsa-sha256 header.s=fm1 header.b=1rgTvRU2;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=OfdjG5iF
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 618891F000C5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jetm.me
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=jetm.me
Received: from stl-compute-03.internal (stl-compute-03.internal [10.204.2.63])
	by mailfhigh.stl.internal (Postfix) with ESMTP id DC5127A0132
	for <tools@kernel.org>; Wed, 14 Oct 2026 16:20:42 -0400 (EDT)
Received: from stl-imap-04 ([10.204.2.95])
  by stl-compute-03.internal (MEProxy); Wed, 14 Oct 2026 16:20:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792009242;
	 x=1792095642; bh=VW/lzRTo58wTE6X980o3QgpEFwCXd4DkLKsagJbYuCg=; b=
	1rgTvRU2CmmE/eavcJJxoaHFpGBeDKk7F39eSClG6nZNf0Q19eDM9EXZ7m/2Rufa
	nVas6j0JHMBI0GhDXy/6Chrcvgi25qFB7i/Nwz9jeQZDqec552yuoLS0s8hAkJzc
	AHiJRkwzA9Q3u0mSNf3dQMTf5LAvP/hzinYgtiFTHmf/OOpgqwE7y7TOfe4ra7QN
	95UiU1soQfigycEakP4vzR3nMpeazHDtpzT9oUOzHxd43cosKwXYT6YR+xXo6ak0
	kRSBpoKk0icM9mV4ZT7ck/7FfcwVsVlTqvYbdM1NRu+DcIAFoxY3JEAn9U9/Oko2
	ZWATu9Cl/YYq851Yw/ehUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792009242; x=
	1792095642; bh=VW/lzRTo58wTE6X980o3QgpEFwCXd4DkLKsagJbYuCg=; b=O
	fdjG5iFru0FKq98zUtEWgX4wGg+ViZKzVU6EN6T3VaDfJ8XPTrpLnxqx5kfb3LY6
	3CGfoTvNfc56vvXx4auRRCGNe8+mP3r+3Zhku3vvQAADPfCZkGvmbSsiMs4Zz0ff
	/22hhaqh/jv2jj5AxZtecvBdimt5qhdlL3KxG391CK6oitzwlDivTfYzQgV59Z0k
	FNgLq6hXw+PguSL7s0YoW5BJ7gmj8MfvtcxmKAfxzu7ex6XFNFhp7pAAZV01VlRi
	TBM0CXIh7ALIOuDyhk4cms6s9iNdhlwrQkjdQ1VVCgSfScnxYeejVRbxVaQEKqyd
	RbMPsBEcIZ3LEFpMzELXQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=jetm.me a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792009242; d=jetm.me;
	mf=PGZsb3NzQGpldG0ubWU+; rt=PHRvb2xzQGtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:EdMpc83o3vdPB4HCfzbXRo+utRxkvIbFff+qBSWzbysHqfu
	wCOnlp3NstQBJB3gpYCkQF1Fk4i3wp48+3g99PpzMEszNd73CGwfiZNTqyn15YbK
	BdXGJ5Ezl2Mzhr8301Ck3oKjja9WehLhsCYBnvHefeSB14tTuwXDjMF5N3uznNDz
	TsDJAQIBNN1VuB1sAtIZ0wDNunMkt+nlDelSD91ECgrEKpF2rXf2QNJN890lLdmu
	m9cRujKQqLWo5YBDAk5soC3D1bdjOSmFi7Mfbvlq4QxKLToP3PX90maDgEaDaFPf
	VG2xPpA/7mKbN/XDZfHH6MSavgKHNu5D+y7cu6Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:bLZQOxyOu0g3jLQjDlQBU/6rOhJ/X/HN18fAY5Edm/g=:1sFC1pmNl0ZAnhimw8VLfRdPs/5VKAIln/rymIbF/sY=;
X-ME-Sender: <xms:GuTPal9-TQ4FJlBm4fal5VQXiKQVNWsYT_yFpkN5HZueqPbT9jdBew>
    <xme:GuTPakj8qnOh7v3prRtcA8Xo-6RefE-5q7EG1Q5_bJeSAOzAlNieNjJOVFhpKu5Sx
    GoeY5lYJ1i4JK7ue3SqklaqztGsQj-aW9AMIxWM_2kFFhNH3bMcFnQ>
X-ME-Proxy-Cause: dmFkZTF7rJ6G4SfBhWKhanBh7XStjcuGVY6uVkCXzxlvzOekFvM1XrP2kUx6nD37S0As2T
    G78o76yyYyODYSbCA7/9DhJkohrE93Ou7z/F5Z8G2eSbOcb386NYPDMF7km3yUYO70Bg3M
    K9H2n0kIbFcXfv5z4Aa/M4Ir1vkSK8ClBMMy9ARiQ1rCU9z2ylAGNh32TJC0yBQx7wCawU
    EAdTreXxT/ZfziybqnMpRngFViQg/Qw7W0LySdEWD8csdlDD6R8wkX4apnwgRM9/cjyWrs
    JLVfznPKULAZ7VYWAmdmvSMqQ4NEY/SWJ8MufMszGeXg6jhKalnRYtqiPKXazM5vFNebkS
    dQ+fX7RcKgqM+kQWwJI8JH5i8pdQM3PKEOeWvwZTl/d+poFOc3TQ3uk1bbhAabDKgLvjVg
    PrjP/U2kVcHiPM5rTOx2cs+fFF9pD+RX+k3Vjr5ehPjKRpJlhv/8iEHMr+ILDIIvMJv0wq
    ID2mwl49w1rUpCF08ygJ203Yiqo6AvC8RaEtUJIih+LIsq6IEy/qIiRuCpil+egePk4Ekn
    ZaA9Sc3gpqgI8AHvUabYzQgynmcpb8JugP12fJjPpBW+g24IAjombwHj0yTS1ktTwQXUyY
    EBIiUR7PUvtmQIKWneI8YRKAa6ORps4rf4xh0Ey8pByK/OlFbJTITa9/aWwg
X-ME-Proxy: <xmx:GuTPap8JhC-jbiN9dHwgjKNny4Drtac74BCmDrLgv7Aq6JXGnOyD6w>
    <xmx:GuTPajuSBHWPHhmcoFUAiZGVg2dsDXUA0Hy-I5DQmO23Wba5uSzH1w>
    <xmx:GuTPako7ABvj_veuqlZUcmWDNMvgHRDrA-ClFqrX0n9QkggQ7MTYzQ>
    <xmx:GuTPaokDcLCAQ7twG1WHwcel2wL8uWQ84LJJzvJDETQgmURch9KbzQ>
    <xmx:GuTPamRHCk_BYvAgMt9sDzBA7puVcWQ4gPudas_SKSd84lB6d_5Wq7-P>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id AAD158006D; Wed, 14 Oct 2026 16:20:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Wed, 14 Oct 2026 14:20:38 -0600
Subject: [PATCH kgl 3/3] Recover from a crash-corrupted epochs.json instead
 of crashing
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-fix-feed-state-corruption-v2-v1-3-41bb71ddc15a@jetm.me>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10714; i=floss@jetm.me;
 h=from:subject:message-id; bh=1sFC1pmNl0ZAnhimw8VLfRdPs/5VKAIln/rymIbF/sY=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBqz+QTGJbZryCXZFj6WV9qJSEtH5fHISlnoAmH/
 BH2wd73z02JAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCas/kEwAKCRC17sMLqGd3
 H9YIC/9k/T3K4bjBTvLe0bBZP0xaf27NmfIyyZIv0ThL3gMBtkrUYY/Wo/ow3x5b1+fqcKsiHia
 iRvEo0OQG6J+XnSX4smpwimLSDOFmAgDfowEcIIDpkVP02lodbsRl+GqVaPA9zvfEf/dZMlYet4
 CRqV+ePWT7K8VAXd4Gl9QeHKelUx5PrVpD8ji6xIKg5Ppe4zghyidZCZcrryvbMDvXir5v07za0
 G8SQ6UUr58eAQ/XHuAT0lKoxaWqIvxgdLpkjW99IKI28/+1fbJjJUuDwSdTGa10Ehu8y/oNZuZ0
 ih4RzZC+0ZvA/ruAMz7vk6uxNJgZZvdXMdcHyaaAQphWoO9bQXwHr83GiI2aSMpWpPG/HspEOmS
 m80V2xqFwEm73pb9T6l38vvHhoV+nSLMX+d07QN1wVa39xL5/TCsrxSDtK0r9L5QoPhFhNJrXQO
 miLvJW4ep5N+XpI6JUwa/Lq476hHybkzO47vyx6Q8cMrtnuYhFE4fJAEnRM13xaGk2Bzg=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20261014-fix-feed-state-corruption-v2-v1-0-41bb71ddc15a@jetm.me>
References: <20261014-fix-feed-state-corruption-v2-v1-0-41bb71ddc15a@jetm.me>

The previous two commits fix korgalore.feed's exposure to a host crash
mid-write, but LoreFeed keeps a second local state file, epochs.json,
with the same exposure and no guard at all. store_epochs_info() writes
it with a plain open('w') + json.dump(), so a crash between the open
and the write leaves a zero-byte file regardless of fsync - there's no
atomic rename to make durable in the first place. load_epochs_info()
reads it back with a bare json.load(), and update_all_feeds() only
catches (RemoteError, PublicInboxError, GitError) around update_feed(),
so a torn epochs.json raises an uncaught JSONDecodeError that aborts
the whole pull for every feed - the exact symptom the previous two
commits exist to fix, through a file neither one touches.

epochs.json is also rewritten on every update_feed() call that reaches
it, not only when something changes (get_manifest_epochs() calls
store_epochs_info() unconditionally), so this is reachable on every
pull against a LoreFeed rather than only a slow-moving one.

Write it through _atomic_write() like korgalore.feed, and raise
StateCorruptError from load_epochs_info() for a decode error, the
wrong JSON shape, or an entry missing a key - the same validation
_parse_feed_state_file() applies to the other file. Catch it in
update_feed() and recover the same way as a corrupt korgalore.feed:
call init_feed(), which re-fetches the manifest and rewrites both
local files from it. clone_epoch() is a no-op when the epoch's gitdir
already exists, so recovery costs one manifest fetch, not a reclone.

Signed-off-by: Javier Tia <floss@jetm.me>
---
 src/korgalore/lore_feed.py      |  37 +++++++++++--
 tests/test_lore_epochs_state.py | 118 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 149 insertions(+), 6 deletions(-)

diff --git a/src/korgalore/lore_feed.py b/src/korgalore/lore_feed.py
index 5594d09..7e39d00 100644
--- a/src/korgalore/lore_feed.py
+++ b/src/korgalore/lore_feed.py
@@ -200,17 +200,30 @@ class LoreFeed(PIFeed):
         epochs_info = []
         for enum, epath, fpr in epochs:
             epochs_info.append({'epoch': enum, 'path': epath, 'fpr': fpr})
-        with epochs_file.open('w') as ef:
-            json.dump(epochs_info, ef, indent=2)
+        self._atomic_write(epochs_file, json.dumps(epochs_info, indent=2))
 
     def load_epochs_info(self) -> list[tuple[int, str, str]]:
-        """Load epoch information from local JSON file."""
+        """Load epoch information from local JSON file.
+
+        Raises StateCorruptError (a StateError) if the file exists but
+        isn't usable - the same torn-write exposure korgalore.feed has,
+        on a file that's rewritten on every update rather than only when
+        something changes.
+        """
         epochs_file = self.feed_dir / 'epochs.json'
         if not epochs_file.exists():
             raise StateError(f'Epochs file {epochs_file} does not exist.')
         with epochs_file.open() as ef:
-            epochs_data = json.load(ef)
-        return [(entry['epoch'], entry['path'], entry['fpr']) for entry in epochs_data]
+            try:
+                epochs_data = json.load(ef)
+            except (json.JSONDecodeError, UnicodeDecodeError) as e:
+                raise StateCorruptError(f'Epochs file corrupt: {epochs_file}: {e}') from e
+        if not isinstance(epochs_data, list):
+            raise StateCorruptError(f'Epochs file corrupt: {epochs_file}: not a JSON array')
+        try:
+            return [(entry['epoch'], entry['path'], entry['fpr']) for entry in epochs_data]
+        except (KeyError, TypeError) as e:
+            raise StateCorruptError(f'Epochs file corrupt: {epochs_file}: {e}') from e
 
     @staticmethod
     def shallow_since(keep_history_since: datetime | None, now: datetime | None = None) -> str | None:
@@ -288,7 +301,19 @@ class LoreFeed(PIFeed):
                 logger.warning('%s; recovering by reinitializing feed', e)
             self.init_feed()
             return self.STATUS_INITIALIZED | self.STATUS_UPDATED if was_corrupt else self.STATUS_INITIALIZED
-        local_epoch_info = self.load_epochs_info()
+
+        try:
+            local_epoch_info = self.load_epochs_info()
+        except StateError as e:
+            # epochs.json is rewritten on every update, not only when
+            # something changes, so a torn write here is reachable on
+            # every pull rather than only a slow-moving feed's. Recover
+            # the same way as a corrupt korgalore.feed: init_feed() clones
+            # nothing new (clone_epoch() is a no-op when the gitdir already
+            # exists) but rewrites both files from the manifest.
+            logger.warning('%s; recovering by reinitializing feed', e)
+            self.init_feed()
+            return self.STATUS_INITIALIZED | self.STATUS_UPDATED
         remote_epoch_info = self.get_manifest_epochs()
         if local_epoch_info == remote_epoch_info:
             logger.debug('No new epochs found for feed: %s', self.feed_dir)
diff --git a/tests/test_lore_epochs_state.py b/tests/test_lore_epochs_state.py
new file mode 100644
index 0000000..882f5c5
--- /dev/null
+++ b/tests/test_lore_epochs_state.py
@@ -0,0 +1,118 @@
+"""Tests for LoreFeed's local epochs.json state file.
+
+epochs.json is rewritten on every update_feed() call, not only when
+something changes, so a crash mid-write here is reachable more often than
+one in korgalore.feed. load_epochs_info()/store_epochs_info() guard against
+a torn write the same way load_feed_state()/_atomic_write() already do for
+korgalore.feed.
+"""
+
+import json
+from pathlib import Path
+from unittest.mock import MagicMock, patch
+
+import pytest
+
+from korgalore import StateError
+from korgalore.lore_feed import LoreFeed
+from tests.feed_helpers import manifest_response
+
+
+def _make_feed(feed_dir: Path, lore_node: MagicMock | None = None) -> LoreFeed:
+    return LoreFeed('test', feed_dir, 'https://lore.kernel.org/lkml', lore_node=lore_node or MagicMock())
+
+
+class TestLoadEpochsInfo:
+    """load_epochs_info() raises StateError for anything unusable, so
+    LoreFeed.update_feed() can recover from a torn epochs.json the same
+    way it already recovers from a torn korgalore.feed.
+    """
+
+    def test_missing_file(self, tmp_path: Path) -> None:
+        with pytest.raises(StateError, match='does not exist'):
+            _make_feed(tmp_path).load_epochs_info()
+
+    def test_empty_file(self, tmp_path: Path) -> None:
+        (tmp_path / 'epochs.json').write_text('')
+
+        with pytest.raises(StateError, match='corrupt'):
+            _make_feed(tmp_path).load_epochs_info()
+
+    def test_truncated_json(self, tmp_path: Path) -> None:
+        (tmp_path / 'epochs.json').write_text('[{"epoch": 0,')
+
+        with pytest.raises(StateError, match='corrupt'):
+            _make_feed(tmp_path).load_epochs_info()
+
+    def test_wrong_shape(self, tmp_path: Path) -> None:
+        """Valid JSON that isn't the expected array, e.g. a bare object."""
+        (tmp_path / 'epochs.json').write_text('{"not": "a list"}')
+
+        with pytest.raises(StateError, match='corrupt'):
+            _make_feed(tmp_path).load_epochs_info()
+
+    def test_entry_missing_key(self, tmp_path: Path) -> None:
+        """An array of objects that aren't the expected per-epoch shape."""
+        (tmp_path / 'epochs.json').write_text('[{"epoch": 0}]')
+
+        with pytest.raises(StateError, match='corrupt'):
+            _make_feed(tmp_path).load_epochs_info()
+
+    def test_valid_file(self, tmp_path: Path) -> None:
+        (tmp_path / 'epochs.json').write_text(json.dumps([{'epoch': 0, 'path': '/lkml/git/0.git', 'fpr': 'abc'}]))
+
+        assert _make_feed(tmp_path).load_epochs_info() == [(0, '/lkml/git/0.git', 'abc')]
+
+
+class TestStoreEpochsInfo:
+    def test_store_then_load_round_trips(self, tmp_path: Path) -> None:
+        """store_epochs_info() now writes through _atomic_write(); confirm
+        that didn't change the on-disk shape load_epochs_info() expects."""
+        feed = _make_feed(tmp_path)
+        feed.store_epochs_info([(0, '/lkml/git/0.git', 'abc')])
+
+        assert feed.load_epochs_info() == [(0, '/lkml/git/0.git', 'abc')]
+
+    def test_survives_dir_fsync_failure(self, tmp_path: Path) -> None:
+        """A directory-fsync failure after the rename must not propagate -
+        the same guarantee _atomic_write() already gives korgalore.feed."""
+        feed = _make_feed(tmp_path)
+
+        with patch('os.fsync', side_effect=[None, OSError(22, 'Simulated EINVAL')]):
+            feed.store_epochs_info([(0, '/lkml/git/0.git', 'abc')])
+
+        assert feed.load_epochs_info() == [(0, '/lkml/git/0.git', 'abc')]
+
+
+class TestUpdateFeedRecoversFromCorruptEpochsInfo:
+    """End-to-end: LoreFeed.update_feed() on a corrupt epochs.json recovers
+    by reinitializing instead of crashing - load_feed_state() succeeds
+    here, so this exercises a path TestLoadEpochsInfo/TestStoreEpochsInfo
+    above cannot reach on their own.
+    """
+
+    def _make_feed_with_manifest(self, feed_dir: Path) -> LoreFeed:
+        manifest = {'/lkml/git/0.git': {'fingerprint': 'abc123'}}
+        mock_node = MagicMock()
+        mock_node.request.return_value = manifest_response(manifest)
+        return LoreFeed('lore-feed', feed_dir, 'https://lore.kernel.org/lkml', lore_node=mock_node)
+
+    def test_corrupt_epochs_json_reinitializes_instead_of_crashing(self, tmp_path: Path) -> None:
+        feed_dir = tmp_path / 'lore-feed'
+        (feed_dir / 'git' / '0.git').mkdir(parents=True)  # clone_epoch() becomes a no-op
+        state = {
+            'epochs': {
+                '0': {'last_update': '2024-01-01T00:00:00', 'update_successful': True, 'latest_commit': 'deadbeef'}
+            }
+        }
+        (feed_dir / 'korgalore.feed').write_text(json.dumps(state))
+        (feed_dir / 'epochs.json').write_text('')  # torn write, same shape as the original bug
+
+        feed = self._make_feed_with_manifest(feed_dir)
+        with patch.object(LoreFeed, 'get_top_commit', return_value='deadbeef'):
+            status = feed.update_feed()
+
+        assert status == feed.STATUS_INITIALIZED | feed.STATUS_UPDATED
+        # Both state files are rewritten from the manifest, not just one.
+        assert feed.load_epochs_info() == [(0, '/lkml/git/0.git', 'abc123')]
+        assert feed.load_feed_state()['epochs']['0']['latest_commit'] == 'deadbeef'

-- 
2.56.0

