Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969F7157A41
	for <tools@linux.kernel.org>; Thu,  9 May 2024 15:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715267103; cv=none; b=J4OCg3/Yn7CUGgmGIPPTsm1tl21+T26zJhBfiS1jb1Hdn01pw6FWlW5OiT4o7RuID+K3GsjMiW6IONrS9Wollb7xBqt73ZTFk29GnJNjqa2Mk+ey0QuZiaxunTs4G14sucqZBzNkSGGMsT5ALXUT4Ub+trpeCvjgY3Xd5Xcyrjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715267103; c=relaxed/simple;
	bh=0ZoWJed8KqGqv4BJgmaKVYafAO0HxcHmUvhCu8MTb1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QkZH5y3kuBn61xlwCKhwKYsvMvDzJJbR9yT6Q755C0nwtZZMXqT9ie16zHj0Sb6SdrDslwFOIVhhWxJEhXpztD/p6TJNtfVDlcu4HkB6bM2ViMVQj5l3rperupohJbN9ciQ2DKO1/lCK45emF2wSB7bxBsWrwzcpQcfxZRvdLoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pmGa7Xs5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pmGa7Xs5"
Received: by smtp.kernel.org (Postfix)
	id 330AAC32781; Thu,  9 May 2024 15:05:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E263BC116B1;
	Thu,  9 May 2024 15:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1715267103;
	bh=0ZoWJed8KqGqv4BJgmaKVYafAO0HxcHmUvhCu8MTb1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pmGa7Xs5neGzo6qD6xHwggh0QlOTczvI4kWVYPTt1w//nKoHv8/tozol3aQNPuwvq
	 yGPaAYCFc67/HAgz4GgDKVPDPRoGJ7oRIPb4MR5SNP4r21TcSz04Xg3cDK41TBDDXY
	 j4QCUN25ck9hkegsG9bi6ajm7IxVW2Wu/1YroXaw=
Date: Thu, 9 May 2024 11:05:01 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: tools@kernel.org
Subject: Re: b4 shazam not stripping ---
Message-ID: <20240509-elated-augmented-tench-5fbb9f@lemur>
References: <2510008e-23d5-4c15-a16c-be9de549a425@citrix.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2510008e-23d5-4c15-a16c-be9de549a425@citrix.com>

On Thu, May 09, 2024 at 01:05:40AM GMT, Andrew Cooper wrote:
> Hello,
> 
> b4 shazam 33b93fdf-bf16-49b8-aec2-0b2c19f5c471@suse.com
> 
> is leaving the notes under --- in the commit message of the finalised patch.
> 
> I cant spot anything obvious that should cause it to be mis-recognised,
> although it isn't a git-written diff.  Reproduces with 0.13.y and 
> master.

This should be now handled properly in master. Thank you for the report.

-K
