Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFC147255F
	for <tools@linux.kernel.org>; Mon,  5 Oct 2026 10:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791195004; cv=none; b=RyVh7/o/+PJZUUoa1dCUx16jooIaIyk7qBky4NYF7qIOUHtuZyDcNwcWAMo6p4h+IP34FWQHn6ObI2C0ZXgZxeVRYwPTgs0Ew83AnJojlbOHT7uWjAkHr2sqsXEaIhKppAiqyFKB2zSCXCkXrvDUgBktI3n9ZdJA//l6I/0KRc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791195004; c=relaxed/simple;
	bh=20Bs1o7Bx0FBoxYzD+tKesLx9+13EZW1Iqt4mmh3CMU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=GI7jREzI9sUvW0uh56VMw8mZofbMk/YvZbp0UI5a9bHDM1GW2ytA5PCE97kgUzR+gfDwfeaZx2NwMaoOTGGl9Rx5YgrJqJrU3u25xfwCf3bNFs4m3Wji4aCDa3v1CLm/8ihbNH9dzPMUk3RII1LqfbcUT5E8hpbtnNv7Vq9bmZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LASWEirB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LASWEirB"
Received: by smtp.kernel.org (Postfix)
	id CB68B1F00893; Mon,  5 Oct 2026 10:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B4A61F000FF;
	Mon,  5 Oct 2026 10:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791195001;
	bh=rSFUfMq0q2HfCpkVq+UJNxQzeeBP1M0JIu/Fxf4CpFk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=LASWEirBTm7rbobmKc+M9e8HaFvY+cJ4ClwU7ILVd65n9E4r5Z6LjJVGMm/ncwqxi
	 OJHfAdkYu82e1fB17bkyO14fNmoXC9Oo2xJFkwrywmyA7dtBT9gUjbyO+MjFM1DNf3
	 rfqCKZ85rphOdHKntf3djzmEyUm+h3qP0/WDKDgc=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4 0/3] lore: three fixes between a posted serie and
 the reader
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20260925-b4-lore-fixes-v1-0-103fd9507e67@baylibre.com>
References: <20260925-b4-lore-fixes-v1-0-103fd9507e67@baylibre.com>
Date: Mon, 05 Oct 2026 10:09:49 +0000
Message-Id: <179119498922.1802901.2100520727149449122.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=713;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=20Bs1o7Bx0FBoxYzD+tKesLx9+13EZW1Iqt4mmh3CMU=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLIOlxfcSb0wU0cgnZfF7fR+mQu8+yxE/vn/ddxmfHTHo
 nfJ01VtOkpZGMS4GGTFFFnK9sVuCip86CGX3mMKM4eVCWQIAxenAEzkrAUjw8vPxz8pvFDr+5uq
 2MiVXVArzHvdi3HXQeuFS6Z2FUvt5mH4X8n0TlbvZZ2LVMlH/+jmYyqhNhVbBOV081bf+GzPbz2
 PBwA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> I'm using b4 in other projects and this allow to catch some issues.
> I used an LLM to find where does those come from and fix them.
> 
> Here is a serie with three independant fixes.
> The first two are linked and come from the diff parsing:
> - a prior parsed file mode is kept and not cleaned
> - a commit diff with a submodule mode didn't allow fake-am
> 
> The last one is fixing some pager issues with less that is leaving the
> window mode when the content fits the screen.
> It was causing tui range-diff issues on my end.

I'll take the first two, but I think the 3rd one needs more work, if
only because it fails ci.sh runs.

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
