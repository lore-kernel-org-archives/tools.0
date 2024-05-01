Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29720165FB2
	for <tools@linux.kernel.org>; Wed,  1 May 2024 21:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714598593; cv=none; b=C/99neEgSQnaAZPlcecbYGsOV5jvzp6UOlMSWzboE3pB3czv3gWnHr93eyDFBfCFZx0qolduRAz3m0JbOs/26r39IYJH7LE2b8I//Z71JBiEv44CKEdZeXr3Qgh7USXgf/bOZJRTpWxuZ9jEH+CP5flWBwSy0A76PrpNBrplkbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714598593; c=relaxed/simple;
	bh=0Kw1fLk89FHy/cFFRUkjkTM/w4l2w/2OlX4HOHyRYnw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YUglXtUUWIitmbx2qkZQNeo9p3jZe0hYFCPKDmUpXl4h/chr1muft51FUQ16rS4QGFLefw8jhPKnOY9BAwRRPDWDuhpZxpb3c+2Dw07RiufaS6Qj0mOKPDR9kx2Hp7zUgcwWRnUkq2umi6cWOCThJZB9JdnDNCj6cNMexZEgPy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=V3EHaifc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="V3EHaifc"
Received: by smtp.kernel.org (Postfix)
	id C07A6C072AA; Wed,  1 May 2024 21:23:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C88C4AF19;
	Wed,  1 May 2024 21:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1714598592;
	bh=0Kw1fLk89FHy/cFFRUkjkTM/w4l2w/2OlX4HOHyRYnw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=V3EHaifcVYXm6tebBHIOTWw1BHdRHANET6v28CSJIUP7nwXgTIO6zBu3UA8dEkYWB
	 n765abh1kYVDvhsoKj8vrYLq8M3FtAoU77RB/DsR7X7PdsuN+vuJNCAQS9TKn40XTW
	 5FN+WciElOfNJyh52agJpbA06/fFXv53gJI/ma5s=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, Will Deacon <will@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>
In-Reply-To: <20240304134241.20447-1-will@kernel.org>
References: <20240304134241.20447-1-will@kernel.org>
Subject: Re: [PATCH v2 0/2] b4: ty: Fix incorrect patch/commit association
Message-Id: <171459859217.935458.14461888310866914252.b4-ty@linuxfoundation.org>
Date: Wed, 01 May 2024 17:23:12 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-77589


On Mon, 04 Mar 2024 13:42:39 +0000, Will Deacon wrote:
> It's me again. This time I fixed my git configuration so that the
> authorship is correct and matches the S-o-B line. That's the only change
> since the v1 I sent on Friday.
> 
> Enjoy!
> 
> Will
> 
> [...]

Applied, thanks!

[1/2] ty: Try subject matching for every commit before using trackers
      commit: 47bd55d3182d875802700670270f5ee0877a8d5d
[2/2] ty: Remove unused 'matches' variable
      commit: dced92071d2135ccbec521cb4face63cafcdc407

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

