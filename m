Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64CB3002D3
	for <tools@linux.kernel.org>; Fri, 22 Aug 2025 14:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755874254; cv=none; b=IxZ2JnijOkXnaQT3ocQ+UMO0gRNqIS2gmUpdYnUDaw8M1kMK98KV8siAbkJWNmvTlDJmzm7RAz2yy9ejiDUXNvJ3C03ZlpmrxvYSvfNa4AdZS0yYfxZ+s/neA8QsVoHgMYO/b5qTwRft5aTCD0u4U7H1OZfwH9Rud21OWA930E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755874254; c=relaxed/simple;
	bh=GxlTXuF23VTGEO7rf3lwuf32Z2VC4lroNhrl75L79eo=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XpmtIzV3VEi8yZB076zmXp0h/H26YaL/cZZ6C5SEwAunuMTbQRoYwKrzJdVrFw/yCLRNTB1DTRgcy/son98zCpWy4iS95WZkKJfkJqgHFyGjw2S4DB/ArGTNvemErNI8Izp/8heKwsXSLd1oFK1BAfVVJe3gXx2L2eNyLyNt2XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yAz/2JPJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yAz/2JPJ"
Received: by smtp.kernel.org (Postfix)
	id 65311C116B1; Fri, 22 Aug 2025 14:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24FABC113CF;
	Fri, 22 Aug 2025 14:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755874254;
	bh=GxlTXuF23VTGEO7rf3lwuf32Z2VC4lroNhrl75L79eo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=yAz/2JPJ5uQO+DOI6lc2Sfpu2U6+rjrw/0CrI6jh1jAqXXcEJ0mSqL1SGtOhe00FR
	 KpmTSJKCEZPFwH5wSFFQ1BpLS6ccL+A+9bCUhleEtX+n7wX6FI89YdPghuL2K4RhG+
	 lD/TjbBpULkvvw6YCRLU21hLVlXHCFFAj1TO9QdM=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, Andreas Kemnade <andreas@kemnade.info>
In-Reply-To: <20250821152639.18903-1-andreas@kemnade.info>
References: <20250821152639.18903-1-andreas@kemnade.info>
Subject: Re: [PATCH v2] use username without empty comments from gecos
 field
Message-Id: <175587425404.514352.8669544712479781923.b4-ty@linuxfoundation.org>
Date: Fri, 22 Aug 2025 10:50:54 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-50721


On Thu, 21 Aug 2025 17:26:39 +0200, Andreas Kemnade wrote:
> Avoid trailing ,,, at usernames. The gecos field does not always contain only
> the username, adduser puts additional information like room number, phone
> numbers and other information separated by comma there. Often these are left
> empty, and you have these commas at the end.
> 
> 

Applied, thanks!

[1/1] use username without empty comments from gecos field
      commit: 50721cdd62ee283ac573e596a499f24aafee5b16

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

