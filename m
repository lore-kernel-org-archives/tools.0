Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B326A325
	for <tools@linux.kernel.org>; Fri,  1 Mar 2024 10:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709288664; cv=none; b=YDPBl8faEyfEuvtMjQ6LiJNJflDOTbHk0X+LHhXBY/3/8EPwKvJyDrTFLhJZRjAsV+pPX+KB51DcgifwG32LOD25h4LhnrB4WBzkDwpeojtDUcLWmlT1BOTuhO0QmXPfEP0sGfSD2jl6nS5K3HmCxFuITZZa9qdtDDLUQeEZ1ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709288664; c=relaxed/simple;
	bh=HorNbdbbg+JnQ5VyWjA45PJEVuopzanHZl/NHr6Gu68=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=plJnyy9FZJ1BxY0x0w8sHSaNqDXjldwTNniHWAsGGq2kmn/wcX6vhDi79XEVV1wyTKbij7twFyaRpA0+siH6TPrxj2eKxiwePlAd8ERWE7p1WPkYRceFO28ghN2i273YtPk0O3Bw50Sbyn6MMJh4UdPV2UXdidyTC4aTyTkM2ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AozxBWez; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AozxBWez"
Received: by smtp.kernel.org (Postfix)
	id D5406C433F1; Fri,  1 Mar 2024 10:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A28C433C7;
	Fri,  1 Mar 2024 10:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709288663;
	bh=HorNbdbbg+JnQ5VyWjA45PJEVuopzanHZl/NHr6Gu68=;
	h=From:To:Cc:Subject:Date:From;
	b=AozxBWezcJ7450AezAxywJOAyREw8MhdnqaO6Ms+zcIgnfC+hbhksiA3C9iKdA1DT
	 xBabzEnr9CLPA+Uidp8FD7ozpP/Zrb5WO+0iF937pItwNDj47xvHF/Hy1Zp4atzIJF
	 ea/0CYRqoTgGf5UFm6/SNLcvhVWq9qGr1hIGx0XwnJGz1fIlWpIiT1ye8vso7I3zb5
	 XcMtOabuAVGwc+ean1iEYgwnr/sJ7PgQIPZcAKc5i918G2aj+Cn23b/8dVWMoD9e3p
	 2I/Gnkr3uK3NQT6fXWnvj02BIY+wIz/VIEYP512Pn+Z8kJmx6h8jOUCcopOmX8FCas
	 X+LPRnOerP9Ww==
From: Will Deacon <will@kernel.org>
To: tools@kernel.org
Cc: Will Deacon <willdeacon@google.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Nicolin Chen <nicolinc@nvidia.com>
Subject: [PATCH 0/2] b4: ty: Fix incorrect patch/commit association 
Date: Fri,  1 Mar 2024 10:24:16 +0000
Message-Id: <20240301102418.17705-1-will@kernel.org>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Will Deacon <willdeacon@google.com>

Hi folks,

I recently ran into an issue where 'b4 ty' generated an incorrect list
of commit IDs in the "thank you" letter. I've had a crack at fixing it
and the details are in patch 1. Patch 2 is drive-by cleanup while I was
there.

Please have a look!

Cheers,

Will

Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>

Will Deacon (2):
  ty: Try subject matching for every commit before using trackers
  ty: Remove unused 'matches' variable

 src/b4/ty.py | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

-- 
2.44.0.rc1.240.g4c46232300-goog

