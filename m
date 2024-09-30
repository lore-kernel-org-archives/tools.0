Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59340433B6
	for <tools@linux.kernel.org>; Mon, 30 Sep 2024 14:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727705255; cv=none; b=DqDqa1kbO7Roke09930ncHuwiBfCv2F70TMy4TYpqRBqhr51mc8L2r12I4Ty2ZcTbWnGl2IcnjPpFkJNwVWTnsZ7jCWk4Eftk6FwT7+bXqO864PGz/jS59KYllz/uXbJjwHkWO7OBl9nfLIeo66fChaSwsr8im/hdCuhwl92ASI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727705255; c=relaxed/simple;
	bh=45WJzA0P/g2EdVJ2lnXjZDehqloa9YYnfFhlgML4fYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZGW9jFMYmgpygFT4k6ZO8EZ2Q55H6lrRkNkUWcJODAuOcp7XuKWjqHEhBoo3iQQNZXZwhWaQXCwNCpRcu1BDkMeeM5ZaQ43klFSHLhx9rtfkaXjtZI++cxnSdlLwV8nE5VQE0D+F+NiTFqxPnNh9M2T+2FtGb6+5g9GzJKthbCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rVlMUl92; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rVlMUl92"
Received: by smtp.kernel.org (Postfix)
	id E7B34C4CECE; Mon, 30 Sep 2024 14:07:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA62C4CEC7;
	Mon, 30 Sep 2024 14:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1727705254;
	bh=45WJzA0P/g2EdVJ2lnXjZDehqloa9YYnfFhlgML4fYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rVlMUl92cKgL/A5KRJNQWMJfzuT0V8dEFGNpvqtK9rsRU3+NWDuNBMP/s0neWbREW
	 gkwkvVIKVcIRQYGdNPfo1vqcegdGNnO6KQBQMS1dGo5pDc5ZjLIAMxAJxG1TcA391o
	 NXLTSa41bL67YhStjFRIflOR4n+Euy86RX+GFGTU=
Date: Mon, 30 Sep 2024 10:07:30 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Daniel Gomez <da.gomez@samsung.com>
Cc: I915-ci-infra@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	patchwork@emeril.freedesktop.org, tools@kernel.org, d+samsung@kruces.com
Subject: Re: Incorrect response address when using B4
Message-ID: <20240930-sapphire-swift-of-reverence-168e2b@lemur>
References: <CGME20240930133009eucas1p14b11ee712ae3ab1ca3aafc2833103bcb@eucas1p1.samsung.com>
 <20240930133007.u4vm5qj5urikpmvc@AALNPWDAGOMEZ1.aal.scsc.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240930133007.u4vm5qj5urikpmvc@AALNPWDAGOMEZ1.aal.scsc.local>

On Mon, Sep 30, 2024 at 03:30:07PM GMT, Daniel Gomez wrote:
> Hi,
> 
> I sent this patch [1] using B4 web endpoint and then I received a
> response email to the wrong address: To: "Daniel Gomez via B4 Relay"
> <devnull+da.gomez.samsung.com@kernel.org> instead of To: "Daniel Gomez"
> <da.gomez@samsung.com>.

Was it an automated tool that sent you that message? Normally, email clients
would honour the "Reply-To" field and not use the From: address put in by the
relay.

-K
