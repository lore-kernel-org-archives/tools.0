Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709297;
	b=raEOVYO+CjEHuF7UeEF0x7MqNQmG+Ng3D4zr0idTogOed6RKWMrlw+UsQEGd9YVX0lJI
	 VMbqVEW9ip0RUdTCPitMVOSvj7/b8lZMJBUorBYAJ7CdfLY6jeLCM8rYrzmhQqFj/Z19l
	 wYomJDEXqjSII5MIjgWZtzO7vHls2tEsV5f0oxRJFXhZUKr8SbpQowisGwQTkEgxMJF5C
	 Q2u0YiQFJULnJ8ZD4TLB8uMetpkH9QrwFgMrCkeX+A55bDWIQ12qKjEZWBxxKVSI6X+sI
	 KEX19EH/fLHbr7moPQtRflE7aybHDhSOzZcyefcZO2EVdkxeJA5OITDyDaq0UBfhcVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709297;
	h=Received:Delivered-To:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=JGCysy/kYIc9MaJBVGZ2bQDzATCuoXU2HXcDW1hIwzo=;
	b=NF+MY0mhX5TWaV2HCWxnEVj81KQ1c7H3Cr8mhmWW8A3e1S9FG3tALyWNUfhbX2XcFcEM
	 SO1FvFMkBsYXv3ajATurPIjuP+7g1PClFtJ8dRh7p3F2rLsNC5WzhsNQkwA+js5CcMtFk
	 4+yn3yCFkNd0MBjD0njMXtinTXrsxxzjzEaGLosM0wP8zaNdixznkx0mYkFXmlGzqCPei
	 6gxCRfdco49mPm3GJUvXIJlKLss4fRNjniXuP3j+jdMbzTlNJz3ZAkNj4Oduqp44YXOzV
	 U0VyQDEies+WuKMD2E3CzIJfL3z4jCnmvFoIjELmbKuLPrgEOjauvdGWaL3slXAjNNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=GFr2WLIC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C840606A31C
	for <tools@linux.kernel.org>; Thu, 26 Nov 2026 16:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=GFr2WLIC
Received: by smtp.kernel.org (Postfix)
	id 2D7311F000C6; Thu, 26 Nov 2026 16:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF3A1F000C0;
	Thu, 26 Nov 2026 16:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795709297;
	bh=JGCysy/kYIc9MaJBVGZ2bQDzATCuoXU2HXcDW1hIwzo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=GFr2WLICSp8Bn5Jrl63oPPxscEpO3Js8CLdhGs0TGjr2sX3ZUksuE+7i6oQ0vLA8f
	 xcgV0q9WLjMSc2SKcEvYXR+3QolvRCX+SeVs2D9AiZRwBTfgEo/itUILctSxl8DSfV
	 w05yIc54j5BT/PzWlekJ1auuAOPlMxyctNO3GXys=
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
Subject: Re: [PATCH b4] review: Preserve waiting series without a review
 branch
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: tools@kernel.org, Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <0-v1-e6b4f8140fd7+20c192-gone_fix_jgg@nvidia.com>
References: <0-v1-e6b4f8140fd7+20c192-gone_fix_jgg@nvidia.com>
Date: Thu, 26 Nov 2026 16:08:14 +0000
Message-Id: <179570929474.2978564.13664564585725620400.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=394;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=dtuWqRRMp/SXbt0FqufIg4dsXUsk8k92fqoAiWBOix8=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLI5IvPXNlxg/DiByUNQxOfsxudBJ99cjp0pvG+PQ1nFS
 tFbNasfdpSyMIhxMciKKbKU7YvdFFT40EMuvccUZg4rE8gQBi5OAZiI3zSG3+yLWlKZ+ORdJfpm
 tosy/xe3uupiWNh2+M2FyMIFdcfXnmX478sYZSV0U++i5a90w+sfHx2bVf916jsZC5ETm+NNGGU
 XcwIA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> A new series can be marked waiting before a review branch is created. For
> example if something happened on the mailing list that warrants deferring
> reviewing it until a new version.  Full rescans currently treat that
> absent branch as deleted and mark the series gone.

Looks like this was already applied as 3dc3f091.

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
