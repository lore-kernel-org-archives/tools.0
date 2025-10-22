Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA00155389
	for <tools@linux.kernel.org>; Wed, 22 Oct 2025 19:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761163064; cv=none; b=m6Ir43hegx8SM5gSa6Mud98qNviQT8VBOQAe+Jpj/aZ91JnN7uA+DwtXacEAcuK9yZRQgcoDAuE2GLQLewE3GgCZ4ZCqyAW9PCmRDxfaUAmQJQrFL9vwyYfNyWKRA+YPl0uT9ToyvUrLtXSDPrEa19HjlMUMsn+3lA2WLPK1jvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761163064; c=relaxed/simple;
	bh=kkkU/KavhBUNNcerT6LGGOGYhW+DZxd9059VOt6UOU0=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=upNWw9tggCioJMEYzQnWGNSlp8RlepvCfZf7NTd5ut7UeXAxH1ZUxT0KDUA9bXmDC8/49/6FT0FfvVcNQQlyIhL+YkVAw2+rL/hE1HnI8GXlMg/UzGwG1tnOvjGhWji466D1RbA9N2YL9Tm1kpg7z+qVbPtzwH/LiUHoZgm8H14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xiFrVy6N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xiFrVy6N"
Received: by smtp.kernel.org (Postfix)
	id BA47BC4CEFD; Wed, 22 Oct 2025 19:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71948C4CEE7;
	Wed, 22 Oct 2025 19:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761163063;
	bh=kkkU/KavhBUNNcerT6LGGOGYhW+DZxd9059VOt6UOU0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=xiFrVy6NxkzvDvXjHQwbQoGShMNCG1yjGk4xhBd/ANEa4k+W1mINQHne3KZRySN8k
	 K2FoHYNZC3IIOVSTbW3tWHZ5qtVBsHoVookH6tcFnPmvLtTYhZEwsZqjK6kUMQmwBn
	 P1WfNu4d4KfWBg5xH5VhAoRXsAAGBXMjCNMP9KB8=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, "Michael S. Tsirkin" <mst@redhat.com>
In-Reply-To: <cover.1760393880.git.mst@redhat.com>
References: <cover.1760393880.git.mst@redhat.com>
Subject: Re: [PATCH 0/2] b4: sparse-checkout related fixes
Message-Id: <176116306333.334203.14010402834008405699.b4-ty@linuxfoundation.org>
Date: Wed, 22 Oct 2025 15:57:43 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78


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

