Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552AD25DD11
	for <tools@linux.kernel.org>; Wed,  5 Mar 2025 21:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741211611; cv=none; b=FnvVJHSxpPKWhoPDiXDtVLStrZ1Bp459gm7tp13POGlNgt7PJnSIkiM0yJPkVGi/a7N4iAt6rZQeV+SkfgoRnbgm2wR/S0X0UWdTs0h8Yt3eDceWbb85LjyX9+8ZGNB7XiVY7yDUweUQnD5HesSQ/oT/h++aXHNB7aVrksViqiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741211611; c=relaxed/simple;
	bh=1Uy23ICV6nXSbiAqe0N5ZhwRRV6M5KqDaOcHA7HRdKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uRDv/VH6XFfHSxBO49qse8nMyByeO8pi7i+xNsTB/lPWobKuId3Xmwg3BhHX42eaFrBRQJgd8HuNEUo69XqW5O6eUEZu4uTOEsM9O4mBGjYgnd81zYHgLm4+V+5qH2TDfGLyQ4PjYbunfMVFywAY92WVTpOGryn3++QXuyX8mzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=F4oPNX0m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="F4oPNX0m"
Received: by smtp.kernel.org (Postfix)
	id D81E7C4CEE0; Wed,  5 Mar 2025 21:53:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C0FC4CED1;
	Wed,  5 Mar 2025 21:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741211610;
	bh=1Uy23ICV6nXSbiAqe0N5ZhwRRV6M5KqDaOcHA7HRdKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F4oPNX0mCjqPt8Yumtdt57/0Jv7BZvNeQO17wRQCz0NohXGUwGMOoaIcbKmygsKnI
	 q+4T6odFTvQxa8NkP788zjUCqsMLqreVkB9vQBKEPQ/KCHJlHii4nv57vPlRAx2oDe
	 YV90fxKGlvjuogzzN7/yAwfnVqdDQoiqI3YTKqTw=
Date: Wed, 5 Mar 2025 16:53:29 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: tools@kernel.org
Subject: Re: b4 and series with a retroactive 0.5/4 patch
Message-ID: <20250305-savvy-fiery-lobster-9fdddc@lemur>
References: <8334309d-32ac-4900-9847-6622bae33bba@citrix.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8334309d-32ac-4900-9847-6622bae33bba@citrix.com>

On Sat, Feb 22, 2025 at 01:38:08AM +0000, Andrew Cooper wrote:
> Hello,
> 
> With current tip of master:
> 
> > $ b4 shazam cover.1740071755.git.oleksii.kurochko@gmail.com

This is a similar problem as with [1]. Unfortunately, the real solution in
this case is "please don't try to be clever with patch series. Simple is
always best -- just post a new revision instead of naming something 0.5/4." :)

[1] https://lore.kernel.org/tools/5972f5de-931a-4186-ab0d-cd226f19cde6@gaisler.com/
