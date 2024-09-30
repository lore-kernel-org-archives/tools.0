Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993222CA5
	for <tools@linux.kernel.org>; Mon, 30 Sep 2024 14:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727706058; cv=none; b=icrjH0flxf9yW9tzU+facwoKMMliCqLar08GMgO6mDgm0o90WNXf0vAnc3TobRRHI1AFHThQuEE0I5brfU4V4jTkMQIm4pWlcBQoR6TOGH2hpbdD+xBRp7FYLilBrKVqjHuKGAYqbIyzbPLvsNhySbXQQupit+TBUnmLvtSB31k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727706058; c=relaxed/simple;
	bh=1eRBRJrzOiuIVTVGRLAO8jbOWOlpEY4/q5p7G1s7jCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fq2AtS+c8gXMXQh9Tzn07DE0dDCLZIBzvstMmQN3auF3J4F87QCDgEwK4QZhB6+ubTXPhZCQx0DhGqX16HJMahfJfkJ7MRqz0SuuXUhWw1dmvlVHU9FOV2MaAw+FZPo0rD1RLml2WnXPuHmmKzFmese78lMP4Q5MSPCF2J7xBss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=naILaSEh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="naILaSEh"
Received: by smtp.kernel.org (Postfix)
	id 56312C4CECF; Mon, 30 Sep 2024 14:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FD3BC4CEC7;
	Mon, 30 Sep 2024 14:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1727706058;
	bh=1eRBRJrzOiuIVTVGRLAO8jbOWOlpEY4/q5p7G1s7jCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=naILaSEhwqimNgUULIFTqSlwxMUbgmh8C2eC73P2q65wypavM5LFHzjS54Dk2AIGy
	 XRAm382kcAq7sXbjLKdoiAbgWueaiQV5eTbTEX8TOfywWXdDa1oTcNbxiZnDz4/9le
	 1mBhLOwyv/Ba3XA13I3vqRQQfHu/UBcjhOzTPQ+4=
Date: Mon, 30 Sep 2024 10:20:57 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Daniel Gomez <da.gomez@samsung.com>
Cc: I915-ci-infra@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	patchwork@emeril.freedesktop.org, tools@kernel.org, d+samsung@kruces.com
Subject: Re: Incorrect response address when using B4
Message-ID: <20240930-rustling-auburn-jaguar-23d200@lemur>
References: <CGME20240930133009eucas1p14b11ee712ae3ab1ca3aafc2833103bcb@eucas1p1.samsung.com>
 <20240930133007.u4vm5qj5urikpmvc@AALNPWDAGOMEZ1.aal.scsc.local>
 <20240930-sapphire-swift-of-reverence-168e2b@lemur>
 <20240930141839.3rjfom4c2tca655n@AALNPWDAGOMEZ1.aal.scsc.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240930141839.3rjfom4c2tca655n@AALNPWDAGOMEZ1.aal.scsc.local>

On Mon, Sep 30, 2024 at 04:18:39PM GMT, Daniel Gomez wrote:
> > Was it an automated tool that sent you that message? Normally, email clients
> > would honour the "Reply-To" field and not use the From: address put in by the
> > relay.
> 
> It was a CI Patchwork tool. Response [1] to my patch was sent from "From:
> Patchwork <patchwork@emeril.freedesktop.org>".
> 
> [1] https://lore.kernel.org/all/172735727458.1107233.1757281470637305143@2413ebb6fbb6/
> 
> I think that tool is ignoring the "Reply-To" field [2] from the B4 message and
> using the From field.
> 
> 	From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
> 	Reply-To: da.gomez@samsung.com

It's no big deal as long as you got the email response in the end. We expect
this to happen with a lot of automation, which is why any replies to the relay
address are auto-discarded.

-K
