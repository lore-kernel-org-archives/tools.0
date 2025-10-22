Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DDA8248C
	for <tools@linux.kernel.org>; Wed, 22 Oct 2025 17:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761154511; cv=none; b=deZ4vV0j7raARFFPOVRp38eizeXrfcmeQ++BRZekElzFOM2LcxdirQz9XB3SjbIb5wxTdHYnZtDB+9xF2wiPT6qNwzKT2ARSFp61z5W+9/ZcneswpoKpfWAYzmJAKqoDmuxXREVjX3A/7XaH3AdPa5bwRCWL7UfpVbMDGMmi5Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761154511; c=relaxed/simple;
	bh=kkkU/KavhBUNNcerT6LGGOGYhW+DZxd9059VOt6UOU0=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RZ9dziO1w/z+swJyuFYJ74WYxnrrjZyGeehXMreFvpl8YYshugPqecvFzLlDz5gGT0UF6P+f5vlRjUU8rvClyGunMCtdz/mxQhBc6PPjjC/9OI1kFVvlTr5+kaC2WgHjSYcH0SG5Z+eYHE4lOQwfiCxxp7ZPt6XACgtYIbf8Vus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=P1qqN7dz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="P1qqN7dz"
Received: by smtp.kernel.org (Postfix)
	id AE8E0C4CEFD; Wed, 22 Oct 2025 17:35:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FAE5C4CEE7;
	Wed, 22 Oct 2025 17:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761154510;
	bh=kkkU/KavhBUNNcerT6LGGOGYhW+DZxd9059VOt6UOU0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=P1qqN7dzqOuDwNf2taFMwDdRXIBXIQdudHzldZFo8XbHlbhMtLtj9iIxJWbALHMXj
	 IhkqUHv+K1k57f27Q5up9pcZtC+CHk+ffESArPEtdr1GKkgoLhL59yTuirMK58afss
	 NKAmCn+Sa2wEh2YrekeHby25zXV0HNmklo4nbpsI=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, "Michael S. Tsirkin" <mst@redhat.com>
In-Reply-To: <cover.1760393880.git.mst@redhat.com>
References: <cover.1760393880.git.mst@redhat.com>
Subject: Re: [PATCH 0/2] b4: sparse-checkout related fixes
Message-Id: <176115451035.320013.16912189059695993807.b4-ty@linuxfoundation.org>
Date: Wed, 22 Oct 2025 13:35:10 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-ffc5f


On Mon, 13 Oct 2025 18:20:04 -0400, Michael S. Tsirkin wrote:
> I encountered shazam test failures, diagnozing them I realized
> b4 misuses the sparse-checkout command.
> This patchset cleans this up.
> Pls review, thanks!
> 
> Michael S. Tsirkin (2):
>   test_shazam: clean worktree before git am
>   ez: cleanup sparse-checkout usage
> 
> [...]

Applied, thanks!

[1/2] test_shazam: clean worktree before git am
      commit: 72af5e2f16d67610a018c08d264cd9c160cce8bf
[2/2] ez: cleanup sparse-checkout usage
      commit: 9e52ea82688a8ca37e6f59a86a723768c6044547

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

