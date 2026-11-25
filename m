Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795585357;
	b=UroJRK9eVZx1drF5TgA78tpMolCgvEg8BcVCZBVMMovz2LEFquoOep1ScCp6Yk89Muz7
	 BmQv/vCklZfupb/ZbJseazSRwTdwww/9gPzLNsKaW1iwedV9E5FxFhiV1OtAGc/8fhwU3
	 YpW/YLQHcDbQt5j9ytJLWSE3tlYm1Kbn/mm80lWt24oE8qoA49RCSpMf4YTz1iguhlDzG
	 xkS0mfpmXy60DG11zSNcZgyS5cmUqVdUkJcmiS0QSz/Y3nqvTqaf8jeGFuXvKG7G/4iYt
	 vhxU49q5SlM8q12ZzChBb/0LFsK/t6hbpTuEA5fK0X2vPH0HpIooFN6OC3nvZvbon2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585357;
	h=Received:Delivered-To:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=JgpHhbVz5VGIXyiT8ArmJKh4PiC06O+VW7wg5Ln2Nqs=;
	b=hnYH1hrorbXKCBcVpn224NDLB8D2h6cz78ZcQP8iYy7Te+/Zn7wvpmmZFePQXqwLOr5x
	 kxF+vqP3uWu3qjpo0LKFrZkKoxyYsscrS2s89mAUtuorILK+Wk8BZaWn0cz/RMJcKhmGE
	 QBSsuuoVRvM7yKa5la/R6i6vFwRy9iZeZK9xCpJq9ABoOwCkty3EGhSrQ/jn1TvYYNV7W
	 ipDvpb/F30rcsZyoKXUdwyda7ATv0R13xW9deFqhqEtwRxKvxetekfH0YE6q3TYLmHdLz
	 FNm51Z6glvQQqDS0oHEwyScBjK4o90VFW5/3WsZfpsSzhqQCwWN/35ONhA2zXqK7xyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tUNYA3be;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C87606A31E
	for <tools@linux.kernel.org>; Wed, 25 Nov 2026 05:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tUNYA3be
Received: by smtp.kernel.org (Postfix)
	id 1489D1F000CA; Wed, 25 Nov 2026 05:42:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933CB1F000C6;
	Wed, 25 Nov 2026 05:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795585356;
	bh=JgpHhbVz5VGIXyiT8ArmJKh4PiC06O+VW7wg5Ln2Nqs=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=tUNYA3beCkNBxrcQtmh65ZtGEDYpp5zY8jIjhPknvcjsyXOK+dEZQ5SsDgPiwBeSz
	 inQ+v2YDtz9+wujJDnXS3d/9Vg7j4yG1ZA1Vh4ZANF/GBP02ZHUPg+Ef0mhanAuEmM
	 Q+GxyQLgMaVA5zlcizVy/mYHpAUyc/bLyyoTqjoE=
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
Subject: Re: [PATCH b4 0/2] Fix .mailmap identity comparisons and the
 missing-cover KeyError
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Hangbin Liu <liuhangbin@kylinos.cn>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20261020-b4_mailmap-v1-0-55965f9201bd@kylinos.cn>
References: <20261020-b4_mailmap-v1-0-55965f9201bd@kylinos.cn>
Date: Wed, 25 Nov 2026 05:42:33 +0000
Message-Id: <179558535325.3954985.2733374421247844119.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1171;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=4JPMMZ/x+4cqYZPp4K1nYH4yvhLbfocxzAi+FwZB6NE=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLLZSr1/Kr++sOn+qj/dy3XtX9zoifcTapCzMFp3KKR2h
 WpcljBfRykLgxgXg6yYIkvZvthNQYUPPeTSe0xh5rAygQxh4OIUgIl8m8LIMMUyd37aKg3TK0Gl
 9cf9K/WMA2zCmWOSvtUfvPZWwXuvHsP/4pAZCmXTuV77bhB8f8NhasF2tR6zO9oLjE67z3NlWVX
 CDAA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> This series closes two remaining identity/tracking problems in the ez
> prep workflow.
> 
> When a tree's .mailmap gains an alias for your own address, git log
> matches --committer against the mailmap-canonicalized identity
> (log.mailmap defaults to true), and 509f56ff5c24 already taught
> find_cover_commit() to pass --no-mailmap so the cover letter stays
> findable. Two comparisons still read the wrong identity, though: %cE
> comes back mailmap-canonicalized even with --no-mailmap, so
> `b4 prep --claim` treated a series you committed yourself as someone
> else's work and re-stamped every commit (patch 1).
> 
> Separately, get_prep_branch_as_patches() indexed tracking['series']
> without checking that any tracking was loaded at all, so any caller
> arriving without a cover letter -- `b4 prep --auto-to-cc` on a branch
> that was never prepped, or a cover older than the search's
> --since=1.year window -- died with a bare KeyError traceback instead
> of the diagnostic every other prep subcommand prints (patch 2).

Thanks, I applied it with minor tweaks.

Best wishes,

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
