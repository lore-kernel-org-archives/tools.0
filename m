Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA241FBF
	for <tools@linux.kernel.org>; Tue, 23 Jan 2024 23:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706051069; cv=none; b=SRh4O6wbJwpuJZfGZQ0OYoZR+Fcp8UJD579v5d3l6sB5W1VkQYnGiVPF89ne6yxGWo5/ayEx3zbzOpeUW2tdNSbzX9MVodAa4C75Vk9xL+IWKVd39wXl+yDCUzSvb6hvmfvPwoncL8K9XzI0b1w/T5BHYE8ZK5lhcd5MYYU7LEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706051069; c=relaxed/simple;
	bh=8iGGpYM3+UouVO7ENT/TyJoqnUdeeXqIA549LAokxio=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Gim9sfy2fr9AGi9CjlpVX1G1AvzRxkcRmBzuzzf7mufMUT15f5V9d7rGcpumPbHhKRZdFXRFeQJRLZGcP5/A7pKwExl6r6mxy3CzEZ2FCb4N6Do/Inm+H7bI+MhJwraJUDeIYlvV+wQGPpqDMf9oD789UTwXz+tRiEV3p5ZTFNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rFgsP11g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rFgsP11g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6064C433F1;
	Tue, 23 Jan 2024 23:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706051069;
	bh=8iGGpYM3+UouVO7ENT/TyJoqnUdeeXqIA549LAokxio=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rFgsP11gqsmFGOAVRrzx2OxBKJ9H0LJzOhU2gpwxC+UDjLmaN4FTQil8xpuB4jZjj
	 kSygee1wLgMzsuJzCuEFWqi6nIfXlt/R3NN31NbpqEgrUTgVGGpeWK9DvqtRRYwFg2
	 VO3/lPU91Xix//1poeY7qn0ba+aMW3M/WlaX3itg=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, Mario Limonciello <superm1@gmail.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20231114042835.48432-1-superm1@gmail.com>
References: <20231114042835.48432-1-superm1@gmail.com>
Subject: Re: [PATCH] Fall back to non-annotated tags for pull requests
Message-Id: <170605106871.53305.14676637143646052785.b4-ty@linuxfoundation.org>
Date: Tue, 23 Jan 2024 18:04:28 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-dc0c5


On Mon, 13 Nov 2023 22:28:35 -0600, Mario Limonciello wrote:
> Not everyone uses an annotated tag, so fallback to a direct ref
> tag if annotated tags fail.
> 
> 

Applied, thanks!

[1/1] Fall back to non-annotated tags for pull requests
      commit: dc0c5559df0ba626dd42d4fe144419585ea609ba

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

