Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903241487E2
	for <tools@linux.kernel.org>; Mon,  9 Sep 2024 16:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725900072; cv=none; b=vDe+xwkregkJB7682yMYsVGta7meyZaCOaQy4rLI8vE1I2ao6EYpHilys6JQfkoXFdZZMicAvnruvuRfief8NfbIyfryqdwKk3KwUyz87RaTa3gpp5JJsqVFzE4EhKwX8Z0jj3Je2hYfLbdc31/sZ1KBQXlEZuNYsE2Eijg8ZMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725900072; c=relaxed/simple;
	bh=KWvsuAqBus7mQ4E/BplmjqdF3GS4s355iA0+q66quAY=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ai6/++qEujU1j/kXZ4FaXXjiDqygqzAMiD7StF2QcXpAHxg0eqfJRbkvTTsZo54Z96BrpcxfdWaeqjYQIDgP5HHb/DepMs2A3UwSQQGZr9tncfU7sDi0uCXwptLmaGwKHQypzEpgEF5rYGwW4mHAru7doYd0+TygXSB4fCvVSNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=P19ly5VA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="P19ly5VA"
Received: by smtp.kernel.org (Postfix)
	id 2F501C4CEC8; Mon,  9 Sep 2024 16:41:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E11BEC4CEC5;
	Mon,  9 Sep 2024 16:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725900072;
	bh=KWvsuAqBus7mQ4E/BplmjqdF3GS4s355iA0+q66quAY=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=P19ly5VA+B8utKiIkaED/3ZT6+XUw1wj/LHitxeTD6cDGNgeW+hGcbBNomxx2Jgcx
	 lwT/bPOzu2El1YuC9Esa3yDfgMKXgBwepjvCO4fgOtxCjwrtsGEPP74DiP4LGY+Jlm
	 iPAp+B+SEZ5ztH+BG7fT1K7BCdL6gkSHzLbxKOQM=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, Christian Heusel <christian@heusel.eu>
In-Reply-To: <20240908202331.386220-1-christian@heusel.eu>
References: <20240908202331.386220-1-christian@heusel.eu>
Subject: Re: [PATCH] change the manpage section from 5 to 1
Message-Id: <172590007179.382068.5675703738395417353.b4-ty@linuxfoundation.org>
Date: Mon, 09 Sep 2024 12:41:11 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88a27


On Sun, 08 Sep 2024 22:23:31 +0200, Christian Heusel wrote:
> Manpages in category 5 are according to 'man man' docs for "File formats
> and conventions, e.g. /etc/passwd", which does not fit the contents of
> the manpage in question. Instead move it to section 1, which contains
> docs for "Executable programs or shell commands".
> 
> Since this also requires a small code change in the docs themselves also
> regenerate the rendered version of the manpage.
> 
> [...]

Applied, thanks!

[1/1] change the manpage section from 5 to 1
      commit: 88a27ce9018a1e886829be0a57336ae0594413e1

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

