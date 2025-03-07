Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443201A5B88
	for <tools@linux.kernel.org>; Fri,  7 Mar 2025 22:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741384986; cv=none; b=a/O3T6Gac6kgSgGZhRMeXg3geVtHVTXKUxT8Y9KiAK64Cfi3oTEkxaAIQuyTXqEwbCxfpqynzoa1pkeeKHDztOsHZbOOtukJqzY3rqYIywh4vvcF54j76W8gxGvgS0rZbjo56TrJ881afwZzGXNOpShs3UPvXsfcnaQRJ+lzAWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741384986; c=relaxed/simple;
	bh=HeMdeZ+Rjaf0KZIrO6jNqcEvNTHx8gSVn8i0pBiB0gk=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=n5fK+gaYWWx7Mknbm9HNfpJagQn4YdeQ8/Hlhd+yBTCDY+t6/KGS8Y7kmPCtS9PPyaLVOxF2+aRVpM9QLkqm+G2SiQd/vQiJsgt19wxMmDmNO7UTSLGPBPbGkmBl4PntwjBpbAw9s/tbAifpUz23pCT8DLFNLLWAaKBBhIHA3c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IlEgn0Ru; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IlEgn0Ru"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE2B8C4CED1;
	Fri,  7 Mar 2025 22:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741384985;
	bh=HeMdeZ+Rjaf0KZIrO6jNqcEvNTHx8gSVn8i0pBiB0gk=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=IlEgn0RuJ8sZjR/SCtaSEzo4eyldLuIJuqLhpEUySVwOAhlRextN3QDhWV4Dqlldv
	 wM1U/U9fGQocKH8RxSbDi88siKp/v8kUtOER/oheT8KfR4fkqJXr3A1Swy609DEXgf
	 51F3qPiEqAZIu1/NpWnOwcS1Wa9cJ5DxZx+VIEoo=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
In-Reply-To: <20250305232923.2902664-2-u.kleine-koenig@baylibre.com>
References: <20250305232923.2902664-2-u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH wotmate] Make the nodes representing a key a link to
 their respective graph
Message-Id: <174138498566.99370.14017864747730811045.b4-ty@linuxfoundation.org>
Date: Fri, 07 Mar 2025 17:03:05 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c25d1


On Thu, 06 Mar 2025 00:29:24 +0100, Uwe Kleine-König wrote:
> With the URL property set, the nodes (in some renderers) become links to
> the graphs of the key represented by the node.
> 
> 

Applied, thanks!

[1/1] Make the nodes representing a key a link to their respective graph
      commit: f4624640df1c3113e7122f8f160b7a86cbba80b9

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

