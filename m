Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE3E212D65
	for <tools@linux.kernel.org>; Wed, 22 Jan 2025 13:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737552472; cv=none; b=Nhnnnfsq+jurSjB7yXWUkqkjeTGlbmrrrHJciukoGA+8xM1IBQjgub92ITf4lMlOOk4wxZgc5gxvnhy/5m9wbSc/fr+s7HhtWYeKiJMKeuyX84IXld6pSJgaNIidPggwMhv5ftbRc8ufs/SApe2/OPnTiyB+/Updn3M3HOMYv3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737552472; c=relaxed/simple;
	bh=dTWq2VIilKxjXFfaqBhXGfCI2rsUKfxazkF5M+U2iW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rdSHGxGo/tR0AoSvKrPsodZIDZu7kd2VBj7vdQTg1pKYJ50t5N0gXXWZDDMExJfSSDXVxM6ftlOxT9jO+eLo4/94CSb7esJXFaDLDA8KH4F4kFxgBeIWvcTpkdb6qQ/Ozvo4qQdLeCHLe4NFUmA9z5EU26l+qGY0vek3MqkYF60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qxzMCjDC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qxzMCjDC"
Received: by smtp.kernel.org (Postfix)
	id A69FCC4CEE2; Wed, 22 Jan 2025 13:27:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 697D2C4CED6;
	Wed, 22 Jan 2025 13:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737552471;
	bh=dTWq2VIilKxjXFfaqBhXGfCI2rsUKfxazkF5M+U2iW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qxzMCjDCQ4hJ2B/L0M32w+dg+oRLhVeXyGe6K8aQMIczcbm1A95gpagI2UVckLykX
	 B5SCX1UBxDXwRHSY/6AA3R3FtXo3KHyzIA58aFu+NugN6Fy9i4KYf+/KzZmnwZMXDi
	 DgcyGKIUfasBoiy3UxOfMdVsmnUkp0iR8wTEJy0w=
Date: Wed, 22 Jan 2025 08:27:50 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: "tools@kernel.org" <tools@kernel.org>
Subject: Re: Bug in "b4 send --reflect"
Message-ID: <20250122-spectral-parrot-of-acceptance-1bbcc9@lemur>
References: <AM9PR04MB86042503FE9B8D0F9EEB3EED95E12@AM9PR04MB8604.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AM9PR04MB86042503FE9B8D0F9EEB3EED95E12@AM9PR04MB8604.eurprd04.prod.outlook.com>

On Wed, Jan 22, 2025 at 05:09:45AM +0000, Pankaj Gupta wrote:
> Bug Detail:
> 
> *	Ran the command "b4 send --reflect", but apart from sending the
> messages to me, it send to all the recipients. 

Can you provide some evidence of this?

-K
