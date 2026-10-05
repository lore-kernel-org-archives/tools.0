Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE151356747
	for <tools@linux.kernel.org>; Mon,  5 Oct 2026 10:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791195091; cv=none; b=XHY0y/mOTIDdZb6EO1W4dvgLrrJklaRNohETctLA3+SjRQonuOCtrCQBzRKJhQkYWlq3iX9yaA0iUm1oAywkQng3Uew+kpEjJro7UpPelLnR2+lt5E+rQYArG28IcJi1tFwwYO9R9ZzbqnyzV7z0hY7aQDqUlosrzD+FtGdnmog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791195091; c=relaxed/simple;
	bh=+SZE9uoZMRJWG/U+9Y7KeftJoKKDygjWvJIboDBPCfs=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=keYpscSlDnLV5CMRrjEYiEqThzGNclt8YlpPFlnX5D/A2UGNER029ismmupy2zwHO0RSoJ089KyodP8tUrsIH3v9SNKobbcB/SeHQp1KSu/rpr9cWYBJAzxbjShnSGFbHbAPlzmbjL48ESxa0SLeJ/iXQsMD5z8+A3SPPANcC8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1gKfZPFc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1gKfZPFc"
Received: by smtp.kernel.org (Postfix)
	id 8A1471F00893; Mon,  5 Oct 2026 10:11:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45DB21F000FF;
	Mon,  5 Oct 2026 10:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791195089;
	bh=IvYjAkrM7LvI0XQrvoUk5B4UduBc8JHhGQq7+L0bfSM=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=1gKfZPFcoDtSUCdv1WSYiZEZqxG5FP+9pQBt5pSzS5zYpWG0WP2X2MmunYO3/P4ir
	 DWhq1W686Io9mHnmphj5090fAz2QmqR7hT3x4HU1P+/xDdhL+LeypgfhHtJ++r8Eti
	 EZgyOaOxFs7Pzjj2rM4tAmTEA+YyAPqLQir1ZO3c=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
In-Reply-To: <20260925-b4-lore-fixes-v1-0-103fd9507e67@baylibre.com>
References: <20260925-b4-lore-fixes-v1-0-103fd9507e67@baylibre.com>
Subject: Re: (subset) [PATCH b4 0/3] lore: three fixes between a posted
 serie and the reader
Message-Id: <179119507942.1802901.9462316134482490996.b4-ty@b4>
Date: Mon, 05 Oct 2026 10:11:19 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=823;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=JO6cjZ2g4b5RnmhSVpVfgAD7ZxSXq1nUKAEOSs8qygA=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLIOl5+/fXgJR5E4O+/VNz679f4nCkUxncs/+khXoSXmy
 2yvbfejOkpZGMS4GGTFFFnK9sVuCip86CGX3mMKM4eVCWQIAxenAEzEfTkjw++cCeKfuXg65v2z
 Fszm3nzu3raHXfuuRzgG3jG76lsp/5KR4XTm5JssNupsWx4ff3l99+ZTjG2XcnV2f1Vwz2f82cu
 exgUA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Fri, 25 Sep 2026 14:50:25 +0200, Clément Le Goffic wrote:
> lore: three fixes between a posted serie and the reader
> 
> I'm using b4 in other projects and this allow to catch some issues.
> I used an LLM to find where does those come from and fix them.
> 
> Here is a serie with three independant fixes.
> The first two are linked and come from the diff parsing:
> - a prior parsed file mode is kept and not cleaned
> - a commit diff with a submodule mode didn't allow fake-am
> 
> [...]

Applied, thanks!

[1/3] lore: parse per-file modes in get_indexes
      commit: c45656e17d1fa2dfa975c9fbde91785828c8a818
[2/3] lore: fake-am series that touch submodule gitlinks
      commit: 5563c054a0b1471cc3f6f0b8179595e6bc457409

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

