Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794314428;
	b=E3ncgZs/+5UzLaV+qrdP99HzZ/2zTxssP+uT/qER6sa0a4lTBa3xGtH30+tqz70/3/BU
	 +BiMLcEUJs2mscjSW8lD65dJ4aUkhyaGh7i7NJAPY+GksdpbTxmckNMAK+IZID7TKBFEN
	 qQ5/Hlmv/fNnA+a0BVkdzH79m5kNR1qL2CUOXCnpgPV3ZIOzPuDkQML6QhYumqHPn7jF8
	 wVhO/pbieMvCFxlj8PyrecDs1Pu7Z3B2dIklO8WGwULXO99we6KQqPDxBGjWllryb2De3
	 22e5DuQRsh1PTdCjRS6src8R2rVz8YM1kaQCgAegWw8GiuGgtU2glZD+BtkJX0edc7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314428;
	h=Received:Delivered-To:Received:DMARC-Filter:DKIM-Signature:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=y4+LAkoDDG/0aRf1jDXIL6Vx6WAXROFZANoOJPIMkH4=;
	b=NvQzmwoR93QQRWkgdlbnV79aqdHyWzqF3oCkyxMB0oIgPj3w0/YALCx+TvQIoR0RDUo+
	 6j+jH22WSCcfNACk6E8Nf3l26iTxfEHy3cjq65kVCj2SgjUZUkiWHUKgrZ+Z+AB20RRfM
	 zeOfJjkr5zPopZC665j1phM1rnKI0wEiJ0bFEfEfifLj+QKrHPQajD0WeVLQVrX2vnmVl
	 WsFtFIcXbHlAJ1rUOK/WM5LFQBF6MjZn63gsJGBnZTnhBXLyA2aSqFVEzQ4hpAOQhyLQG
	 3pzEuGQachEDPYhRHzrinMrkKazTvuBb9rnb3EFghC5GRJ7jPJy5Uj8zJ5HjmlibABA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=virtuozzo.com header.i=@virtuozzo.com header.a=rsa-sha256 header.s=relay header.b=I9TwsIbS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2579860A3803
	for <tools@linux.kernel.org>; Tue, 10 Nov 2026 12:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.a=rsa-sha256 header.s=relay header.b=I9TwsIbS
Received: by smtp.kernel.org (Postfix)
	id BA2941F008BD; Tue, 10 Nov 2026 12:40:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=130.117.225.111
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794314427;
	b=ZxEEIa0H15ujNDE5wBESYgNHSiOn7OOKXdqrt1EdgFrvIB2yhK4ZmqZyjZpt1jHI059+
	 162k7pcDR2/UFC9XZrMInyrVmKpD9kbIWGN2cPJicaunmpz87w8Ai2ROtzAi2c5mfb0vI
	 OrB6HaGh68FEdZmueZJY7rQ2BQgFBzYKBvR7DgoEpqqvmEp78PQGkqJU3h9OY+PwuuSa2
	 IMVJSNdN85kG8znBiQiqm2DSPle4rk7wxgVKKiKsgRUtD8Wrg/04fIpD69G+dbjx/Q2Uf
	 QYHuGE51gINcjRZuw4KqXLE7DOo+JND445tPV7muBMfOLvWObYEbV35JeF6vx4Y7ugw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794314427;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=y4+LAkoDDG/0aRf1jDXIL6Vx6WAXROFZANoOJPIMkH4=;
	b=IhgyMKYGDfBTlswOzazP0XeWKgK2vkdX5VMoQPd/8pghTf1asPFtuj668Q5bJrm0+XrL
	 NihnpsLaKTM+i6AYRyfB6M5hqIyFFvJG7jWlu4K7g35XmK9qriLMYCzSBL3QbCUuhb/ui
	 PmidPGbYyDTzsRiXuquRWBUWJCKRgwu/eHq0KcwkmtfIGo4MT8HLHQrsVdM48hd7NgEDz
	 QFu0JmBMQ72G6j/rUUnNjqY1dt7RSFXY84V2wBAaUTbtipgBzfZDfvgXKGWmuIzHqVHZR
	 B3ejuByIX2Lw3Zh129L8Zd0rKnXG0oBlnQ4eoXWcExjIxUbJ9d+Kv4GVBSI65tbxksQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=virtuozzo.com header.i=@virtuozzo.com header.a=rsa-sha256 header.s=relay header.b=I9TwsIbS;
	dmarc=pass header.from=virtuozzo.com;
	spf=pass smtp.mailfrom=virtuozzo.com;
	arc=none smtp.remote-ip=130.117.225.111
Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 293F31F008A4
	for <tools@kernel.org>; Tue, 10 Nov 2026 12:40:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=virtuozzo.com header.i=@virtuozzo.com header.a=rsa-sha256 header.s=relay header.b=I9TwsIbS
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 293F31F008A4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=Message-Id:Content-Type:MIME-Version:Subject:Date
	:From; bh=y4+LAkoDDG/0aRf1jDXIL6Vx6WAXROFZANoOJPIMkH4=; b=I9TwsIbSczzazhZ4bnP
	UaiMhivYQSLcJwzYPT1qNuAAvj6RRZ5RldLkPKtS3ABk65TcYdHWxPol/z+kVfHaMU3T2Y1/idrtJ
	+bL8pNMrXcSjvH3JegMdL1puh2Sc6nssQwmB2TEvyROF59jMKUX9sboDawtw5pkaL5g9O2uYxYQTd
	fkIA5GR+/Kidc56bqamZ/JRm+LW5fCNX8jPMOFxaMkjXDjNDLFCmAOF0Q92LmAyORCvTbpnoyC1uI
	qqILj2xU8ZswkSrKW+RpMH117WUAsCXVW124DF1nYZ+2rfKn8CXDEVbVeJ7NG48uQ+ZS3CXZPnWaL
	086ZGpVVdqXds/A==;
Received: from ch-demo-asa.virtuozzo.com ([130.117.225.8] helo=f0.sw.ru)
	by relay.virtuozzo.com with esmtp (Exim 4.96)
	(envelope-from <khorenko@virtuozzo.com>)
	id 1xQl52-00E82C-25;
	Tue, 10 Nov 2026 13:40:08 +0100
From: Konstantin Khorenko <khorenko@virtuozzo.com>
Date: Tue, 10 Nov 2026 13:40:11 +0100
Subject: [PATCH b4 1/2] review: do not carry sent reviews over a revision
 upgrade
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-b4-prep-khorenko-upgrade-skip-sent-reviews-v1-1-4533266d020f@virtuozzo.com>
References: <20261110-b4-prep-khorenko-upgrade-skip-sent-reviews-v1-0-4533266d020f@virtuozzo.com>
In-Reply-To: <20261110-b4-prep-khorenko-upgrade-skip-sent-reviews-v1-0-4533266d020f@virtuozzo.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Konstantin Khorenko <khorenko@virtuozzo.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1657;
 i=khorenko@virtuozzo.com; h=from:subject:message-id;
 bh=2nSdOJW+kgtwtLnd/kzJvOB8bHsVBBt5Uejgbdv/3jM=;
 b=owEBbQKS/ZANAwAKAVGWCkf5YVwqAcsmYgBq8xCx8AG57fkWd1ktqCCszweXgUxRdPgI5wIbn
 cCW6XtrEqaJAjMEAAEKAB0WIQRWD23IPcXT0GO9CCxRlgpH+WFcKgUCavMQsQAKCRBRlgpH+WFc
 KjxID/472i3tvEyKpwVJTbnHJEg2NC5gL+S2Ycjuk9gEsUdKBVNOpLPkToGyjywtAEKPOpuu0uo
 MzvqN/VKR6UafLowblihjxm0P/UTG7rizwK8wOIjbRhfzfVPqF/Wb7EDiugrjtVdjG/64SwNS9Y
 6p9nEBloYrDNm+E5uz09oXmxZmDqH6D/WYKinhFliammK4g5O75uiwDl7d8C7730dj3HqZnleRL
 Fhq7jkRP/CVjI6cCPRTJzuUsd2Vk+eL9kDcfsF+5Tvg4OMrQ6pZq7lfCxmQuSNovT+Z7wL5fU4q
 YRJjzs9gMzQnzQpE3LEnOptIRih21xL2EBDw6UO5M6EfRyfIbcmcM/WG7kh1a7TPBtZmd07k85M
 u9RTj/tl8U/HWkB+ppCu0+Ida8ufdMiOb6qBGRfaEnXqxPYCi5sci9VS9Om1pchuyTYsY55z7mI
 iJxEstLF7q660QF9aI/pDA6dBuiN+kQPT/GEn0C4W/saswZP0/T+Tf7WeM5PqE0StdA6RV5ix86
 Bhq+8fHKxkPfOMar9OCHvAYQWQqQ4xCDivekBRVfDfUwYYzDrDzUwI1BZruu7YlOlLN3vZdDOJT
 DgQsoDkh3v/EpWoBiWLGAgY6kadGOJ7suWfjjeU8tVun6RWTR6Z78UZxdNZ9w6oRQYiX9orsUiu
 P5WAZIN/J9auv+A==
X-Developer-Key: i=khorenko@virtuozzo.com; a=openpgp;
 fpr=560F6DC83DC5D3D063BD082C51960A47F9615C2A

On a revision upgrade the maintainer's reviews of patches whose
patch-id did not change are carried over to the new revision, unless
the series status is "replied".

The status only says whether the last action on the series was a send.
A series moved to "waiting", or re-entered from it, is no longer
"replied", so reviews that already went out come back as drafts.

The next send then refuses to go out until every such patch is marked
done or skipped, and skipping also leaves the patch out of the take
by default.

Do not carry the maintainer's own review over when it has
sent-revision set. Drafts that were never sent are still carried over.

Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
---
 src/b4/review_tui/_tracking_app.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 714f215..5fa2b2a 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -4778,6 +4778,10 @@ _TOFU_NOTES: Dict[str, str] = {
                 if carry_over_reviews and patch_id in saved_reviews:
                     # Deepcopy so we don't mutate the saved review data
                     reviews = copy.deepcopy(saved_reviews[patch_id]['reviews'])
+                    # A review already sent is no draft, whatever the status
+                    mine = reviews.get(my_email)
+                    if mine and mine.get('sent-revision') is not None:
+                        del reviews[my_email]
                     restored += 1
                 else:
                     reviews = {}

-- 
2.43.0

