Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794314429;
	b=Ip1j9XfUc2anKnz3nm62DoGYTcAP+pSv5YG9oPJg6XeeEzdl7BdlYX+9+1A3/dUU6870
	 G8XDoDj3H6iGd7t4GH8wiXPqXpb+Gt+CfsYjSKEV/88qnxRr05JOhBCYRTY8XHOC9qog7
	 tweJEgEnvIH9g9em4ZBtwg6Y1So3uJHxTgl6mqjwoAsECyKbZ8RrBhOr4r0iDb2uMwM2k
	 T5hUqAPrZc0uTVcTPQpxNlnRNZDCj+/cL9QDm25Cc5SonZi8b3pz8M33QMRDRD8W8gNkh
	 r+frVVhZFrsiYqvOHHjVJ6ofDvre0zHlTmNOwxhABIPkrPsgrbKIj1r6F96nCh4zsUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314429;
	h=Received:Delivered-To:Received:DMARC-Filter:DKIM-Signature:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=J325x801hlZwHbRQbkQ7wgCif3ti4FPSglSOFKuA3ww=;
	b=pa5308Kl45AplQnQne3O4zy4qmC5qhLhn6TXFSBmfk3ZtJw5XtfkUpucJlJ8CUGC+RAm
	 O2R8RoMKzMcaAEY+PtoHSCcGNgLDf2NOPadNAFc6jxJtYlq5n+r1p+G5dHISCP6Af9dTs
	 fxoHIBcRqmEoPpKzR8R4x4du5ier98o8B0PMJnqR1HVfp8JqR98QLJWHlzWrYLc5JVj26
	 k2Y6qlgSxDowgA7akhU+x4BWkUJzCM/OZj9i6IFM4zaGQ8uABVl8CiK0pq4cUTYMHErqA
	 mgFv4J58bxJ6Rqt9DygPgS+kidCEmxHLXHh+/rG5yf9nHoTGD1DDaHe7VoLFwd3u6og==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=virtuozzo.com header.i=@virtuozzo.com header.a=rsa-sha256 header.s=relay header.b=VrAaB6k4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2576A60A3802
	for <tools@linux.kernel.org>; Tue, 10 Nov 2026 12:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.a=rsa-sha256 header.s=relay header.b=VrAaB6k4
Received: by smtp.kernel.org (Postfix)
	id E02571F0089F; Tue, 10 Nov 2026 12:40:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=130.117.225.111
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794314427;
	b=SOWP9r77K3nuHi2GkXVcAihw5Hwmny1Gs7BiWl7LQ1quVXRjRamjL1qfgghEbOLvAFCr
	 8quCFcjv+2QcWExO0gU2FDTkhrtnORdCNzTdTa2wKF0wsZ8q+jMZ5fYCHhCOlhDtJLkhq
	 bJX7woaVspR3DLVH8xs9+dvXFGW58rdGNBRH3hlp/AuczzKDVBex0hd68sjhssIZjRpRv
	 ljOoUPEVOrPTsPRCcU5uoqC1+q5Vd5sH2ILjI2wAd1DfJ42WM3Q4gv2MqT0h/BdAoFb4/
	 DcaFA/IokPB+HB6HzkRFrxP1EI50t+VM/4w1O9BkAqdN+fjA5MAzAP2OTh9Tr0ADWuA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794314427;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=J325x801hlZwHbRQbkQ7wgCif3ti4FPSglSOFKuA3ww=;
	b=Ln2SDiqZSIDnWO0CmYv4vWi3wpr1T9FlJStKuCcHCMXtLXjdGp2y7jYX6SPGzCYDLJSl
	 /zJzsL1Gx84qBnX3sZ1P4MXjawmObMa3Lar1gyjcX51MM/qZPoJgl0IKio5Fk6Wc4e/0o
	 TTuwjPeFlrAGL6UFv/5Fq5f5n8O/S6Mncg5Z2ss46Mf6BcCrN6BLtB0UVmG08JT9JzZln
	 z8BGL3g6cPxthqnFU5QUSw+xy7QqrCyieBxazvqW1QmJSyN17yqpFsEzs5n2cgUjsspo1
	 g5S25Y+3D+AQSKPLmHTAdGk6li0mFjoP/x1UJ+zX8cagJC1EAGYTZNHjcla07+kKK+g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=virtuozzo.com header.i=@virtuozzo.com header.a=rsa-sha256 header.s=relay header.b=VrAaB6k4;
	dmarc=pass header.from=virtuozzo.com;
	spf=pass smtp.mailfrom=virtuozzo.com;
	arc=none smtp.remote-ip=130.117.225.111
Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8ECAE1F008A3
	for <tools@kernel.org>; Tue, 10 Nov 2026 12:40:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=virtuozzo.com header.i=@virtuozzo.com header.a=rsa-sha256 header.s=relay header.b=VrAaB6k4
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8ECAE1F008A3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=Message-Id:Content-Type:MIME-Version:Subject:Date
	:From; bh=J325x801hlZwHbRQbkQ7wgCif3ti4FPSglSOFKuA3ww=; b=VrAaB6k4KMrBXCNrHj6
	FGdda2/lsepwj275No35M9XumM1g6qrgUJ8wjbLDbD2rngf8dltyF/c22F9ctTY3WH83aC818wb6M
	BLdO9iRYDV/p4ZjFXQOuU1gZlTFtaLg3zhNEDu/2TTr2nN/rWoRGYaatK4R14b2XU0KKoYadqHlax
	fjknlCJWIuEebPbt+cQp9rAw5WqhXfRlYyorvHgOjvmmbNoowDjXOZSqvQ7GGK0suqsiBT8akQHKq
	On0D8po9HRvay0OU/c+GRi9tC4rpd4WD11ydJXyTsV2R8RnmnTpETysXKO5xVIH1wfRLtDUQyWheO
	sd1pD2dqBuoDkuA==;
Received: from ch-demo-asa.virtuozzo.com ([130.117.225.8] helo=f0.sw.ru)
	by relay.virtuozzo.com with esmtp (Exim 4.96)
	(envelope-from <khorenko@virtuozzo.com>)
	id 1xQl52-00E82C-2d;
	Tue, 10 Nov 2026 13:40:08 +0100
From: Konstantin Khorenko <khorenko@virtuozzo.com>
Date: Tue, 10 Nov 2026 13:40:12 +0100
Subject: [PATCH b4 2/2] tests: cover review carry-over on a revision
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
Message-Id: <20261110-b4-prep-khorenko-upgrade-skip-sent-reviews-v1-2-4533266d020f@virtuozzo.com>
References: <20261110-b4-prep-khorenko-upgrade-skip-sent-reviews-v1-0-4533266d020f@virtuozzo.com>
In-Reply-To: <20261110-b4-prep-khorenko-upgrade-skip-sent-reviews-v1-0-4533266d020f@virtuozzo.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Konstantin Khorenko <khorenko@virtuozzo.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4113;
 i=khorenko@virtuozzo.com; h=from:subject:message-id;
 bh=k77/XCxJNpj9MpoEGvTht+wv0SAHD18lw8vQfdesMvM=;
 b=owEBbQKS/ZANAwAKAVGWCkf5YVwqAcsmYgBq8xCxLXEHaDIKMRtiVw66vyl+0zGuiw5JZnn5x
 VqGQtkRqeuJAjMEAAEKAB0WIQRWD23IPcXT0GO9CCxRlgpH+WFcKgUCavMQsQAKCRBRlgpH+WFc
 KnFwD/9qcaqU9U9d1lETQ+9NDwbAilfIFn9ppv9aIlzWczYu3+DDLsMpIcy/U+OhZ5QssvrFu81
 F6nCXq6AQLdCF0n8VbrslhuU/7GZZYRY52YEiyohKwhCrSR8H8K7HOCNJrWBT81M2eI8YbqsZEK
 iD06bDBrVaU+pyEFcDUzAebTYJOo8qYOMR4YqQeYEZNJP0LvGoXNoglLFDhe6kvMzItJdSq/IZx
 9ZBDpqIpXADe+uWejJVtP0fayyMCECCOCvjP+ccigT253LxLAXTGrHdEzRaYEBNkivIpNWrHwcc
 FwDrGedy7iMDJmqFsQM32qO8J7lgedRfQX54JSnTkBNRbdGEiZkONWxprM4siOtvp7LCbZ/94lD
 5Pj5NRyeG1z2LEyIOjdm+hcAfbq+vDLh7Q3g8P5PFRy0XAZeexV4JkCPrpa5l8omYdoaHuCknGW
 UR+LxduN6yxJqz+Qik/4hxvom0hCF0If6t9Ftz1sPMs04X4JbQBn+BOtzYjrXWXZFwCaIbyNaiD
 FE0731spMiP0WN7strCQ8IvnutqQgSYEBPbA3Bqd/lCO2b0t7v9SvXxXz1wf36zQ2g7j+EO//U/
 oL6aKV9wCETiLMdxHAV1LOyBDySs3a9C22yQ0OGeDGueTpofa8qx9TpkbpcodCMY91UCPrc8fT1
 47Zfy/BvxYK7Cgg==
X-Developer-Key: i=khorenko@virtuozzo.com; a=openpgp;
 fpr=560F6DC83DC5D3D063BD082C51960A47F9615C2A

The upgrade carries the maintainer's reviews of unchanged patches over
when the series status is not "replied", e.g. after it was moved to
"waiting".

Check both sides: a review that has sent-revision set is dropped, and a
draft that was never sent is still carried over.

Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
---
 src/tests/test_tui_tracking.py | 72 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index 88a8663..fb1a414 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -3449,6 +3449,78 @@ def _mock_archive_branch(
         assert ecode == 0
         assert head_sha == start_sha
 
+    @pytest.mark.asyncio
+    @pytest.mark.parametrize(
+        'sent,carried',
+        [
+            pytest.param(True, False, id='sent-review-dropped'),
+            pytest.param(False, True, id='draft-carried'),
+        ],
+    )
+    async def test_upgrade_carries_only_unsent_reviews(
+        self, gitdir: str, sent: bool, carried: bool
+    ) -> None:
+        """A review sent before the series went to "waiting" is no draft."""
+        identifier = 'test-update-carry'
+        change_id = 'update-carry-1'
+        review_branch = _setup_update_test(gitdir, identifier, change_id)
+        my_email = str(b4.get_user_config().get('email'))
+        my_review: Dict[str, Any] = {'name': 'Maintainer', 'reply': 'Please fix.'}
+        if sent:
+            my_review['sent-revision'] = 1
+        old_tracking = {
+            'series': {'status': 'waiting'},
+            'patches': [{'reviews': {my_email: my_review}}],
+        }
+        new_tracking: Dict[str, Any] = {'series': {}, 'patches': [{}]}
+        saved: List[Dict[str, Any]] = []
+
+        def _patch_ids(topdir: str, branch: str) -> List[Tuple[int, str, str]]:
+            return [(0, f'sha-{branch}', 'unchanged-patch-id')]
+
+        def _load(topdir: str, branch: str) -> Tuple[str, Dict[str, Any]]:
+            return '', old_tracking if branch == review_branch else new_tracking
+
+        def _save(topdir: str, branch: str, cover: str, trk: Dict[str, Any]) -> bool:
+            saved.append(trk)
+            return True
+
+        app = TrackingApp(identifier)
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            with (
+                patch.object(app, 'suspend', return_value=contextlib.nullcontext()),
+                patch('b4.review_tui._tracking_app._wait_for_enter'),
+                patch('b4.git_fetch_am_into_repo'),
+                patch(
+                    'b4.review.create_review_branch',
+                    side_effect=_fake_create_review_branch(identifier),
+                ),
+                patch('b4.review.get_review_branch_patch_ids', side_effect=_patch_ids),
+                patch('b4.review.load_tracking', side_effect=_load),
+                patch('b4.review.reanchor_patch_comments'),
+                patch('b4.review.save_tracking_ref', side_effect=_save),
+                patch.object(TrackingApp, '_archive_branch', _mock_archive_branch),
+            ):
+                app._on_update_base_selected(
+                    'HEAD',
+                    _make_mock_lser(),
+                    b'mbox',
+                    1,
+                    change_id,
+                    1,
+                    2,
+                    'v2@ex.com',
+                    '[PATCH v2] update test',
+                    review_branch,
+                )
+            await pilot.pause()
+
+        assert saved
+        reviews = saved[-1]['patches'][0]['reviews']
+        assert ('reply' in reviews[my_email]) is carried
+        assert reviews[my_email]['patch-state'] == 'unchanged'
+
     @pytest.mark.asyncio
     async def test_apply_failure_restores_original_branch(self, gitdir: str) -> None:
         """A create that moves HEAD and then fails leaves nothing behind.

-- 
2.43.0

