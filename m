Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECC2277001
	for <tools@linux.kernel.org>; Fri, 28 Feb 2025 18:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740769029; cv=none; b=bEsbnpU093BjYYkmeBr+Tk8mQQmR7B1aOsi0F3Zo+RHsJoHmXfP9rb1bfdwuClNHHaY5yB5Nj7aOGsSm1TOnB1vICB4DDJWq+GeiAOhJV4QWi7I9XUClhVD7S0ludC4b27fNJe384Lw+CbF/HZDCG244EXZDafCxv2yPrPn/E+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740769029; c=relaxed/simple;
	bh=yZYp8TVrPL9M2oRTDF+yPVkXMjgPZorc/EhSRN/Tnsw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=P3Qn78YcWumUXvG8eI6SQgvBi7RR0Ve6kMiDXa10oFbhxcUnWf393mxEATEvCCaQ0Uqz07RpLMaJaFEZiCjXZbKKaidOKudMu/XS7ouLDTcZfigO3qh7k6MqMi9OInhMcXt7yQ1oXEh3wUhQpUR3d5zjafMY7l02ZRVDXVwCHMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lxuscn0j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lxuscn0j"
Received: by smtp.kernel.org (Postfix)
	id DF5DDC4CEE5; Fri, 28 Feb 2025 18:57:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A184C4CED6;
	Fri, 28 Feb 2025 18:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1740769028;
	bh=yZYp8TVrPL9M2oRTDF+yPVkXMjgPZorc/EhSRN/Tnsw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lxuscn0j5UIEoxNdD3vNGpqHBX2wYyzsEIUxm+/K68cs7xaCx8TGR73vySDr/2yAF
	 1IudBzeN4rWHnratslOr4Gh5XaGMXPpc+e+1/K6/2CavkZYavRsfurziOcNPBAjL/q
	 2nSTLTGVnmBJJCBrbnAgF+YPsHbPVMnj3Kb5jxpU=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: tools@kernel.org
In-Reply-To: <cover.1740729275.git.u.kleine-koenig@baylibre.com>
References: <cover.1740729275.git.u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH wotmate 0/3] Some wotmate updates
Message-Id: <174076902851.1334994.2585843478953229033.b4-ty@linuxfoundation.org>
Date: Fri, 28 Feb 2025 13:57:08 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-42535


On Fri, 28 Feb 2025 09:08:36 +0100, Uwe Kleine-König wrote:
> this series consists of one minor fix, an addition of comments to
> improve readability and a tighter check for key updates.
> 
> The fix ("Fix foreign key references in sig table") has little practical
> relevance. But it helps a bit if you look at the generated database with
> sqlitebrowser.
> 
> [...]

Applied, thanks!

[1/3] Fix foreign key references in sig table
      commit: c29a88449fb90a776f30cca4bf57f8ab1707e0db
[2/3] maks-sqlitedb: Annotate fields from gpg --with-colons for feeding in the db
      commit: d644b413b1f6e1606e9f4b8eae92538e738efa39
[3/3] export-keyring: Only accept changes that please the Sequoia linter
      commit: 11543a5fad7831a8802e99106f6be7cef94b5476

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

