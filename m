Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD2C471CE7
	for <tools@linux.kernel.org>; Fri, 25 Sep 2026 12:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340635; cv=pass; b=RRd2dsjfLlrdLHi0U/FqRbPZxvEHSBb4IxoHyCTYEWsmnRYZKF4Bfz8FErSy38E4I5tCX466ypVa0yoUKoPKeji6WrcZwcP4Vif3bKc0dNjP0jC+NqA+AhJDUzzorJRaWAaYTKVRRzPECHrQgjQHFsxY9qMsdgCWwoBeib+KM0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340635; c=relaxed/simple;
	bh=Y5UXbHTVu35fx7DDCIywujg36QX5H7/77pzORIQ+gbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mZ7SHY9vi6IN3KXNTx1MmLcUWyvsaZP+/We/UzE5106bPYOh0mXM7m9oDlrQjRQnxp9li1PTfATGlKx7+eQbEdrIP3AfLoH0qSbH0bZrUa8tCewzz37m1mWykTa0PADM2ZaTgfNWh8BZCi6OfvxZi0Hr7ibm9/1LFdZCMR9Kkyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=pFbYI3KA; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="pFbYI3KA"
Received: by smtp.kernel.org (Postfix)
	id 787C81F00898; Fri, 25 Sep 2026 12:50:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.225.140
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790340633;
	b=vyssqrVRb4f2hCaU4Nd9gH5ob5aYcg01A0Wm/gaxXphsyKNg8L2dVICIq242H2tRa1/1
	 TVZkwmXPOZypYfHnPNAeT08rtzXMhKbd3FLm10yKoa/ZyFh6Ec6rJK5GvL7VfqZFTO/zM
	 HfCsTSfPwKvCt6OmmIKz+YgUmQK9XfACB9vgydV9d7JVuy7a44gNxbWI0ofqP6qI9IPqx
	 BknhK0LcwjB5XQZHGr2F0kxTAkx8Vk/uGmiPwtLdnhGi1dBbI5mmwfKTZYmEmyCR7cE9x
	 1uLtUhgl4Uj1BQT3rqmCxf8HLBHFDLnnuBIjSPJgXEI8zNDcIZem7W+m+c1iRRtJn7w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790340633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=rnPbTfpkFRYIVJCOEDtv8FFQdybQQSj8Y2xrC8T14YE=;
	b=tg/ny4NtQQWPcBH/y3TRTflRDWTT2/MetXhwXRF6vuuJWVLFsA5yW+qWW6lWHWUn2vk2
	 lC2O6mpdFalptZSHr6Kg3vZnHm9X2j0LAn+nq1baNFyOaoD11vXt8KeqGQml4SreJ6sNN
	 C2onGxasuecjqfZFZrBnbKo5YYufeNbKTuSL/kr/butcaMIeh+w+B4D45vFgK5TCuvLXK
	 6oSm1hCLCt2+HuJ8YflVYfIeOJQAaSLzyy6Ab5RSNs/kFW//nyKckCjZAEmjKHobEfg2b
	 FhYFwjeQUmWeFBG6IuJA8yw6aG+dXTvDn1l63rGcLs4dH8A7jruhRDnEWo0NZt5M8PA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pFbYI3KA;
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=74.125.225.140
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8A8A61F00899
	for <tools@kernel.org>; Fri, 25 Sep 2026 12:50:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pFbYI3KA
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8A8A61F00899
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso9186985e9.1
        for <tools@kernel.org>; Fri, 25 Sep 2026 05:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790340631; x=1790945431; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rnPbTfpkFRYIVJCOEDtv8FFQdybQQSj8Y2xrC8T14YE=;
        b=pFbYI3KAFxNOq4JYZ3cl24YgrHCTtt3L1YJyNdUHFA8EDX1bG7gD6WL+iUwuqC8EPH
         g8/7tLgRKKywJYRdAEuWyphMa25yuO8c2/Aoel2ra5jONIVCe8YsaIxdPRt7d+1GMl+5
         mPoVGVxtn0doDsFW40MpBDi6+e12GmQN9LhRgOjqbggtxdSjSwh54FECyd0WldjR0aXB
         bOi40Vf1+9Z/y/A2i3CJjyldcFCkv3Y+Ye2qssfDRV/OJL11KEVkLTl/Adi9d83xKU+3
         R7b44+6Aqbw30SfRjPnp2IFGWWOY5M7AuSOdH2Os4wkVhlkTLThZM/QTToRqNeblEKBr
         Cr6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790340631; x=1790945431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rnPbTfpkFRYIVJCOEDtv8FFQdybQQSj8Y2xrC8T14YE=;
        b=hEPg7qx1GCl7soNQbGM/bi6uuv7YwRj3ccrQhDc0gCBRzji339iaZUknMti/k8Kcud
         DUBgRMl2gpLmdn/Mc+djVCKQnTShRHhovshsuo276NxMfGRxbroA+c8mTOCW97c//A32
         N/IXGX7sK+4HgDL3E0gbiZnwrDrIpnCLERtcz4glzoASZ7YFu2D8xUY8T0wOeJ2O3k7E
         nc4xyUlgQkC5vn0c6geL8UwO9yRasNRcggMNqlj+mNVBKjg1+WO12WXK8YN2evHZD/Qr
         Wlt7lh96bj1S1OFE8Qb8Mfg9BYwThVypEzDNZq9Os6ZrIgTRPxH/hKB+yS88wHj4+Gu9
         NTPw==
X-Gm-Message-State: AFuF++nZFZ+BVHnCePhwpAx2gIQwQeEYOTxx65jCmCHCeOlJwnwNFcWN
	czQ0RDSdop1gNjLIdjaRY0xF+SqYy4+FLY+eCIUdvBN4eyupLt/MOgvdz+A+Q6L2HBB0Z+HSaAr
	pLIcg
X-Gm-Gg: AYBFou3CQAyCa5+8GFhgbw+/jJ1okbnGu6KQGaGDfIk5bSdP5DuuQhGJ8EEhGP0IptM
	vRKRSKbf1NJ057qZyFJnSrjrSq/m4gFKrmvkYBEbwkVzxhVgX3MY99avbgpJsHO7k5Q00U7WQhg
	adUtwzRtFb8ZdNq7jua1MoLZkhb0S3+SpHwPKBlfI6P4SGhoMaXCArBQNU9pAclk1uGnF38eSx7
	wXWzt+jsqfITv+4ZXddN/sYH2DJF0mFrfTI8E4QpYb6AovZok7cNCXULHRgOvgG7Gih+ie4fuu8
	5jrgKbTxhRsfLBxrgUS7WRduq+mn6oPGuvTCccfR/i/Uj+T99UwlrxooMgwWZfBmlRVtjp0ECof
	vJEJDTP8KPndyuNAIBF6MKlfYee+JGO4yOoJuQ2FmUQ3M07dZS7UIkLnWZ8gG+j5o0qk/4JPlYk
	r3L/euI6nuyPusX3myeIQLgDEsbQe/MKHcLWOMX1A2Xkg1ffbt6xCF2XT0cJli7fQ4+wMwI30ZT
	aC9Q9IW+gsCYoZR+Xls
X-Received: by 2002:a05:600c:19d1:b0:49c:d818:8764 with SMTP id 5b1f17b1804b1-49fe7b62c5bmr94321305e9.11.1790340630911;
        Fri, 25 Sep 2026 05:50:30 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5de187asm144945365e9.7.2026.09.25.05.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:50:30 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 25 Sep 2026 14:50:27 +0200
Subject: [PATCH b4 2/3] lore: fake-am series that touch submodule gitlinks
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260925-b4-lore-fixes-v1-2-103fd9507e67@baylibre.com>
References: <20260925-b4-lore-fixes-v1-0-103fd9507e67@baylibre.com>
In-Reply-To: <20260925-b4-lore-fixes-v1-0-103fd9507e67@baylibre.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

make_fake_am_range() binds every preimage through a blob lookup, but a
gitlink's old value is a commit in the submodule's object store, which
this repository cannot resolve, so a series bumping a submodule could
never be fake-am'd at all.  "b4 diff" on such a series gives up with
"Could not create fake-am range", and every other caller that needs the
preimage tree loses it the same way.

The diff itself has both halves, so for mode 160000 bind that sha with
"update-index --cacheinfo", which records a gitlink without the object:

  index 1a2b3c..5d6e7f 160000   <- gitlink mode
  -Subproject commit <40 hex>   <- the preimage, in full

Assisted-by: claude-fable-5
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 src/b4/__init__.py         |  38 +++++++++++++++++
 src/tests/test___init__.py | 100 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 138 insertions(+)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 3e9145f4a6a5..f55e9d9e73aa 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -1540,6 +1540,44 @@ class LoreSeries:
                         # renamed file, make sure to not add the new name later on
                         logger.debug('  Renamed file: %s -> %s', ofn, nfn)
                         seenfiles.add(nfn)
+                    if fmod == '160000':
+                        # A gitlink's preimage lives in the submodule's object
+                        # store, not ours; --cacheinfo binds it without the object.
+                        section = re.search(
+                            r'^diff --git \w/'
+                            + re.escape(ofn)
+                            + r'\s.*?(?=^diff --git |\Z)',
+                            lmsg.body,
+                            flags=re.M | re.S,
+                        )
+                        glink = (
+                            re.search(
+                                r'^-Subproject commit ([0-9a-f]{40,64})$',
+                                section.group(0),
+                                flags=re.M,
+                            )
+                            if section
+                            else None
+                        )
+                        if glink:
+                            bound_hash = glink.group(1)
+                            logger.debug('  Gitlink preimage for: %s', ofn)
+                            gitargs = [
+                                'update-index',
+                                '--add',
+                                '--cacheinfo',
+                                f'{fmod},{bound_hash},{ofn}',
+                            ]
+                            ecode, out = git_run_command(dfn, gitargs)
+                            if ecode > 0:
+                                logger.critical(
+                                    '  ERROR: Could not run update-index for %s (%s)',
+                                    ofn,
+                                    bound_hash,
+                                )
+                                return None, None
+                            continue
+                        logger.debug('  No gitlink preimage for %s', ofn)
                     # Try to grab full ref_id of this hash
                     try:
                         bound_hash = git_revparse_obj(ofi, dfn)
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index 980082e26a49..18de9ab0f114 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -1881,3 +1881,103 @@ class TestGetIndexesPerFileModes:
         assert b4.LoreMessage.get_indexes(diff) == {
             ('run.sh', '8888888', 'run.sh', '100644')
         }
+
+
+class TestFakeAmGitlinkPreimage:
+    """A series bumping a submodule has to fake-am in either hash format.
+
+    The preimage of a gitlink is a commit in the submodule's object store,
+    which the superproject cannot resolve, so the only copy of it anywhere
+    on this side is the one written out in the diff -- as 64 hex digits in a
+    sha256 repository.
+    """
+
+    @staticmethod
+    def _bump_repo(
+        tmp_path: pathlib.Path, object_format: str
+    ) -> Tuple[str, str, int, b4.LoreSeries]:
+        """Build a repo whose gitlink bump names objects nobody has.
+
+        Returns (repo, base commit, hash length, series).  master keeps no
+        gitlink at all, so the index lookup make_fake_am_range falls back to
+        has nothing to find either -- exactly like a submodule that was never
+        cloned here.  The bump edits README as well, so the gitlink is not
+        the first file in the diff: a mode is per-file state, and one left
+        over from the file before would bind this one as a regular blob.
+        """
+        repo = str(tmp_path / f'gitlink-{object_format}')
+        ecode, out = b4.git_run_command(
+            None, ['init', f'--object-format={object_format}', '-b', 'master', repo]
+        )
+        assert ecode == 0, out
+        assert b4.git_set_config(repo, 'user.name', 'Gitlink Tester') == 0
+        assert b4.git_set_config(repo, 'user.email', 'gitlink@example.com') == 0
+        (pathlib.Path(repo) / 'README').write_text('readme\n')
+        for args in (['add', 'README'], ['commit', '-q', '-m', 'initial']):
+            assert b4.git_run_command(repo, args, rundir=repo)[0] == 0, args
+
+        hexlen = 64 if object_format == 'sha256' else 40
+        old, new = '1' * hexlen, '2' * hexlen
+        parent = 'master'
+        commits = list()
+        for idx, gitlink in enumerate((old, new)):
+            ecode, _out = b4.git_run_command(
+                repo,
+                ['update-index', '--add', '--cacheinfo', f'160000,{gitlink},sub'],
+                rundir=repo,
+            )
+            assert ecode == 0
+            if idx:
+                (pathlib.Path(repo) / 'README').write_text('readme v2\n')
+                assert b4.git_run_command(repo, ['add', 'README'], rundir=repo)[0] == 0
+            ecode, tree = b4.git_run_command(repo, ['write-tree'], rundir=repo)
+            assert ecode == 0
+            ecode, commit = b4.git_run_command(
+                repo,
+                ['commit-tree', tree.strip(), '-p', parent],
+                stdin=f'point sub at {gitlink[:7]}\n'.encode(),
+            )
+            assert ecode == 0
+            parent = commit.strip()
+            commits.append(parent)
+        base, bump = commits
+
+        ecode, mbox = b4.git_run_command(
+            repo, ['format-patch', '-1', '--stdout', bump], decode=False
+        )
+        assert ecode == 0
+        assert f'-Subproject commit {old}'.encode() in mbox
+        assert mbox.index(b'diff --git a/README') < mbox.index(b'diff --git a/sub')
+        # Back to a master that never heard of the submodule.
+        assert (
+            b4.git_run_command(repo, ['reset', '--hard', 'master'], rundir=repo)[0] == 0
+        )
+
+        lmbx = b4.LoreMailbox()
+        for idx, msg in enumerate(b4.mailsplit_bytes(mbox)):
+            if not msg['Message-Id']:
+                msg['Message-Id'] = f'<{object_format}-gitlink-{idx}@test.local>'
+            lmbx.add_message(msg)
+        lser = lmbx.get_series()
+        assert lser is not None
+        return repo, base, hexlen, lser
+
+    @pytest.mark.parametrize('object_format', ['sha1', 'sha256'])
+    def test_gitlink_preimage_is_bound_without_the_object(
+        self,
+        tmp_path: pathlib.Path,
+        monkeypatch: pytest.MonkeyPatch,
+        object_format: str,
+    ) -> None:
+        """Both ends of the range carry the gitlink the diff named."""
+        repo, base, hexlen, lser = self._bump_repo(tmp_path, object_format)
+        monkeypatch.chdir(repo)
+
+        start, end = lser.make_fake_am_range(gitdir=repo, at_base=base)
+
+        assert start, 'the gitlink preimage did not make it into a fake-am range'
+        assert end
+        for commit, gitlink in ((start, '1' * hexlen), (end, '2' * hexlen)):
+            ecode, entry = b4.git_run_command(repo, ['ls-tree', commit, 'sub'])
+            assert ecode == 0
+            assert entry.split()[:3] == ['160000', 'commit', gitlink]

-- 
2.55.0

