Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD1925FA13;
	Tue, 30 Sep 2025 12:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759237117; cv=none; b=UotXk/VoexADK7kBqVlxbFaPMWOO9Im/pnUVhEIVW+MY1EgceEVnm8PWSIMRStV1XgZiNvA3smyMz5cOGDBnM6JQQp+3HCl8pR9caUrJy//gDLtYhz8cRNMXc4OJQYC5Ga2el/ZGvCiZmEQV5QDBLzwjpYa/B5QjjkC3Pw7jgVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759237117; c=relaxed/simple;
	bh=TZumtKkZTrBsv1JHKDxwzea27lCJOu9syMvcCqK5s2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T8n6GwlpI9e94L4THwZU5fmTFcmDHSD+IzIyBbe/Om7CwmmnXjWam5PAXgOQApT88y3KD5t1xK7PXDERmV83YW3wHkr6PzNuBLR0Vq/A6kmIEYHEGjcl8WtQ4lL/ErrvJEInbHH3hPPLPyB4fH1zf1qg/uE6XdU55SRjU45wv0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=y+LAn3Z/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="y+LAn3Z/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 917F9C4CEF0;
	Tue, 30 Sep 2025 12:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759237116;
	bh=TZumtKkZTrBsv1JHKDxwzea27lCJOu9syMvcCqK5s2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=y+LAn3Z/8jCco6rucwnnE7Nuroykjr+f//cbuNQzH4ZuG/W93l9CgsM6/fB6rK7Hd
	 kv9srOk+bH901t6qRaaZ7k1ZN2Kr67DiYpzeDNdqjTdht+UWUDuj7IcCmbQrEBGyZZ
	 k0pSuBOWCHARE/JRv0bb2VcaH364kYqpDxE0GuAA=
Date: Tue, 30 Sep 2025 08:58:35 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: users@linux.kernel.org, tools@linux.kernel.org, kernel@pengutronix.de
Subject: Re: b4: shazam: UnboundLocalError
Message-ID: <20250930-fluorescent-careful-marmot-0afecd@lemur>
References: <20250930-groovy-soft-octopus-bd626a-mkl@pengutronix.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250930-groovy-soft-octopus-bd626a-mkl@pengutronix.de>

On Tue, Sep 30, 2025 at 02:18:48PM +0200, Marc Kleine-Budde wrote:
> Hello,
> 
> current b4 master crashes like this during shazam ("am" works though):

Thank you, confirmed.

bugspray tag me

-K
