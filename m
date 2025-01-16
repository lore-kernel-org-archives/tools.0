Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A38B2309B8
	for <tools@linux.kernel.org>; Thu, 16 Jan 2025 20:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737060580; cv=none; b=kaIQCZTj65fGpfQN/t5FQNo/qIJTylCCoIr7QQ1uveqO9fmO80QMWtygYxl5O4tVhIU9PoyKAfk8w7mTVYZHIzTbR+yVD7I4CnX8gqHcIULc4I+FBZye2IIFKGptJP5BZgRhpzOta1Q8ZUgsxzW9mZ/NhzBn2cLyso7Lsw9MUuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737060580; c=relaxed/simple;
	bh=dGAp8NffT43/QY3pwEhihCKaGEqfCZGyjQEoAxAlCpc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NGIYEM5/pc0vq9fSAGKf7sTai3k6EYmdF8C3Uv/sFHd7E3ONITiB6yp1IkG0vINxOM8Mf9GIkJcPsoLlKtuct0yhTqf/REEDf60hTqynyIitf1Ub+Zd4rjnd1wqh6gQsieaisMuXy1xgKHvTRlzDXj9RrUft6Ynyq284BE2a9Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BLDHN41K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BLDHN41K"
Received: by smtp.kernel.org (Postfix)
	id DD0CDC4CEDD; Thu, 16 Jan 2025 20:49:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84D1CC4CED6;
	Thu, 16 Jan 2025 20:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737060579;
	bh=dGAp8NffT43/QY3pwEhihCKaGEqfCZGyjQEoAxAlCpc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BLDHN41KFDs3HOP4IGRSgHAR4Vjquf1jG+pOwbW3MV5OcmfV3Yzdg1sCVrzbFS6V6
	 ND9xd1L4UeXYyHMKJ+2A6Hrrd2WjUcXaauOhPigv1jBi1IrEaHvv5WorArJCI0rPd1
	 Ayqix0/npHY2j84qPUvV+IZvTz1pzdzmsJqr7X2c=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, Patrick Steinhardt <ps@pks.im>
Cc: Junio C Hamano <gitster@pobox.com>
In-Reply-To: <20250115-b4-pks-no-full-index-v1-1-23a4e8fa83da@pks.im>
References: <20250115-b4-pks-no-full-index-v1-1-23a4e8fa83da@pks.im>
Subject: Re: [PATCH b4] b4: stop generating full object IDs for non-binary
 diffs
Message-Id: <173706057943.65851.3946439182941778223.b4-ty@linuxfoundation.org>
Date: Thu, 16 Jan 2025 15:49:39 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-33ea6


On Wed, 15 Jan 2025 17:29:32 +0100, Patrick Steinhardt wrote:
> The patches that are to be sent by b4 get generated via git-show(1).
> These patches get generated with `--full-index`, which causes Git to
> print the full object ID for the pre- and postimage blobs. This is
> somewhat annoying to read and doesn't help in the general case:
> 
>   - It does not help in case the recipient doesn't have the necessary
>     objects anyway.
> 
> [...]

Applied, thanks!

[1/1] b4: stop generating full object IDs for non-binary diffs
      commit: 33ea697cc3d0bc77d2f3fb58176116608a0f1332

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

