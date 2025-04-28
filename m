Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB9113D893
	for <tools@linux.kernel.org>; Mon, 28 Apr 2025 21:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745875787; cv=none; b=iDqZU/0JI3KePOdoKXMTqN6x7GJ3oL8Xf9GFrOp+2EhWJOH3R9VLJu1n7cX0AopB2EOjoYkqNWFAmUrJ3OE9bLRWFfa+Wbh44ilkvTzEek/rxk7/c0e3KY83P0GN6lohDPGReG0RKjbvPU7lvXwcHAjnfl6rBNclfeIlFYkot0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745875787; c=relaxed/simple;
	bh=4NHI2d1ylTaPSgGc4cKb+mUyFxxuSgNBosGZxqC8CCA=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=hxkGS4QQOiu8L8lDWXiGesVe7Hg5JeYRhpywjmqkhu6eD+suYVjsuq5WOhitwzfwFinUdHZHWNf2h78eeFXCszTC4vC9Xc2nkiz7zSxG2uy+3pFqLq0FRXNtKeFuAToyaGOu6Rr9YVUuOQCRWCUuqH4FdATZ8QJK7z4hoZzGn80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RPV1gnSK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RPV1gnSK"
Received: by smtp.kernel.org (Postfix)
	id 85216C4CEE9; Mon, 28 Apr 2025 21:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A60CC4CEE4;
	Mon, 28 Apr 2025 21:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745875786;
	bh=4NHI2d1ylTaPSgGc4cKb+mUyFxxuSgNBosGZxqC8CCA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=RPV1gnSKgU8j1QokLdIZXjNH4upYRv2QOck1lgpEGXYzla79/3lSTpfW9nS3QtVzr
	 3nx5L9IU7K/7lHigyntj0uy/p5WMS+Jz/jVL3cWzbUTdWVwxzAmc/P1wM17Fm9LjTn
	 /lMmdnqfOcvXxjANRoFQe0iVfM9pI64BhgSw2CVRWbQ1em18q/3foQ/jENGsFEe/dl
	 3OMRmMJUs/Rilv/fPsi0mZgbRWL0GFxDus21whhJUxtbcLHA+tgokaxlhz6YdFPEo4
	 oVXpf9Iu5U2bRnEdZ7qhj+5dHbVxVyfhr5i4YN3zAiHFKLyb6uTr67sMzIqniH9cuM
	 n/WxrxrN44ifw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 748CD3822D43;
	Mon, 28 Apr 2025 21:30:26 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: andrew.cooper3@citrix.com, anthony.perard@vates.tech, tools@kernel.org, 
 konstantin@linuxfoundation.org, marmarek@invisiblethingslab.com
Message-ID: <20250428-b219993c2-49c69b8f53c5@bugzilla.kernel.org>
In-Reply-To: <b19f33bc-df96-4365-bef4-7f1393fc7ce3@citrix.com>
References: <b19f33bc-df96-4365-bef4-7f1393fc7ce3@citrix.com>
Subject: Re: b4 inserts Reviewed-by tag from unrelated thread/patch
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Mon, 28 Apr 2025 21:30:26 +0000 (UTC)

Konstantin Ryabitsev writes in commit 048adc880245925f7a62639fc0cc58c9e086b3f1:

Fix trailer attribution bug due to incorrect thread traversing

When we were walking the thread looking for where the trailer belongs,
we were incorrectly attributing trailers sent to a single patch as if it
were sent to the cover letter. This only happened in the following
situation

 [PATCH 0/X] Cover Letter
 |
 |---> [PATCH Y/X] Patch Y
 |     (patch being reviewed)
 |
 |-----> Re: [PATCH Y/X] Patch Y
 |       (follow-up that *doesn't* contain a trailer)
 |
 |-------> Re: [PATCH Y/X] Patch Y
 |         (follow-up that *does* contains a trailer)

In this case we had a bug in traversing the references where we first
looked at the immediate parent, and then straight at the top of the
thread, becaues the references were not reversed when we had parsed
them.

This patch fixes both the incorrect order of references AND it doesn't
trust them to be in the correct order -- it will now always rely on the
in-reply-to header to figure out what the parent of the message is.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Fixes: https://bugzilla.kernel.org/show_bug.cgi?id=219993
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=048adc880245)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

