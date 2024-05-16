Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2BF14601E
	for <tools@linux.kernel.org>; Thu, 16 May 2024 12:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715862378; cv=none; b=GTY7f7WcT22/9h3YPcXiibcp08pE/8BIIqKa/EeLB3bwazca4iqal7fJbrLhCw+YoqjYK7rGNZvMmo/2ybpEdcC48Gnl7sIoWsegvsA/9UhvW3cskBeKGKctRIk4GCMoCyG5NvaiQXiR8uzG0muIpL5L4FrP8x/W6ih/Ykr0G3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715862378; c=relaxed/simple;
	bh=t/uLzSDzvISUs9Mo/C6rp5DdmsbVhSXNripK01xVYvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ERDXYiVzAm4ggotXuSTEd+3NZ+4PrYolMtqkCPd7uhlb+6XpAeVDxikCB5ej6NZidPNsP3GTx0snPuUdwpPiP4pQ2l+P0rOSRHtQ9fU1gqlzbnrvXVZT0mc7STVMyk1LIgS6+igOJ8uP+rF5yJpOZCtA3YA1pq/hJX5l9fBc6Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cOOCW0G6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cOOCW0G6"
Received: by smtp.kernel.org (Postfix)
	id 0AB1CC32786; Thu, 16 May 2024 12:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC34BC113CC;
	Thu, 16 May 2024 12:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1715862377;
	bh=t/uLzSDzvISUs9Mo/C6rp5DdmsbVhSXNripK01xVYvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cOOCW0G69QZBvqAxghmu2xFtztcsCMr0jwZxm1QVGP9PJUiEuePp8AKK/GJnK7/uB
	 6LqItJ8bEl2mDpkciD90nsEbcLaekWoHtftrTd5TIV19mMUgmhoUMUOSqjms333oMQ
	 vxqdXs3aOMbpPdLKlgwMpsz1F79SEM3n1Tvnwi2Y=
Date: Thu, 16 May 2024 08:26:14 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, tools@kernel.org
Subject: Re: b4 one key git rebase -i
Message-ID: <20240516-glorious-crocodile-of-adventure-4d5784@lemur>
References: <b483c569-66b1-4a4c-913f-3b60ebcd1743@app.fastmail.com>
 <b89ad184-f920-4f6f-af9c-59ff9ef52b8f@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b89ad184-f920-4f6f-af9c-59ff9ef52b8f@sirena.org.uk>

On Thu, May 16, 2024 at 12:53:06PM GMT, Mark Brown wrote:
> On Thu, May 16, 2024 at 12:47:45PM +0100, Jiaxun Yang wrote:
> 
> > Is it possible for b4 to have a one key git rebase -i to whole series feature?
> > Or at least have a command to output base commit hash, so I can make an alias for
> > that on my own. I think that would streamline my daily routines a lot :-)
> 
> You can get the base with:
> 
>   b4 prep --show-info | grep base-commit

You don't need to pipe this to grep, this will work, too:

    b4 prep --show-info base-commit

In fact, if you are looking for a convenient alias, adding this to your 
~/.gitconfig will let you run "git b4r":

    [alias]
        b4r = "!git rebase -i $(b4 prep --show-info base-commit)"

-K
