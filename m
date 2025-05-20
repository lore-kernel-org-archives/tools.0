Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC3718BBAE
	for <tools@linux.kernel.org>; Tue, 20 May 2025 21:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747775166; cv=none; b=jAF0P3DVUYDt5ODG8i2YaGZyl7zuDz5/iiWKOBjh5JoD7RAJ9nHBi2FKv4EnnEo1OjG21I8xOJJf3RDl71Q1eL7i9UvjensxVBC9LnYPW9C19PR3j2mJj+YkQvbB9U5adLGX6TluqLuV2y5bKQuhX9ExjcrITADdW2xM3zEgr0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747775166; c=relaxed/simple;
	bh=/XjKfWH1vuNHxVfO7C8OWxXnSLikaZKWnI7JbHjrllE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=h3pmT9VJF+/bXq+UUXC8ykgpXmZDY+sQj4pcCI0wjtilY7Qi4M+nf4LglywWEaUhuyO3xoef49EsneAK+ZPTYclWtGqd76KhSJ1N7VeDj4e0pJThDQoA/ayoEMikV1DMIe3aBGS6nhZyOYjEcPB49+htyRnALuRatvdNCbMH840=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PFlBTswX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PFlBTswX"
Received: by smtp.kernel.org (Postfix)
	id C87DCC4CEEF; Tue, 20 May 2025 21:06:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75AFBC4CEE9;
	Tue, 20 May 2025 21:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747775165;
	bh=/XjKfWH1vuNHxVfO7C8OWxXnSLikaZKWnI7JbHjrllE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PFlBTswXR4GwAf+dUEP8FTjmjtGiMus8CL6D9FJbsR7NJT/O9h9CRR/vPph45nLQe
	 rChPsnbqHitL95vyE44gilLIHH5qgQ3G3MTxZ2lij4BqYkow+s+SNhUEpF3Ggc3vzr
	 ODrBnmbHq07yWvN7pMsfd4yxF5qRsLMQHQJkKNHQ=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: tools@kernel.org
In-Reply-To: <20250519101429.1558947-8-u.kleine-koenig@baylibre.com>
References: <20250519101429.1558947-8-u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH wotmate v4 0/6] Cleanup, a fix and txt representation
 for trust path finding
Message-Id: <174777516534.2236866.1732622101699563359.b4-ty@linuxfoundation.org>
Date: Tue, 20 May 2025 17:06:05 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-6f78e


On Mon, 19 May 2025 12:14:30 +0200, Uwe Kleine-König wrote:
> This is v4 of the series that I called "Updates to wotmate, partly due
> to changed behaviour in gpg" before. Now it does some more things, so I
> renamed. The previous submission is available at
> https://lore.kernel.org/tools/cover.1747038870.git.u.kleine-koenig@baylibre.com/
> 
> While testing different things with the kernel pgpkeys data and trying
> to understand the path finding algorithm I wondered if that couldn't be
> done in a simpler and then also faster way.
> 
> [...]

Applied, thanks!

[1/6] Put a representation of the trust path in a txt file
      commit: 5dc1be5c03f06b0c508f4e41773092f8329d3915
[2/6] get_all_signed_by: Return a plain list instead of a list of 1-tuples
      commit: 0b03c5aa1dfdb01eaae83a3388cf539cf601eb2e
[3/6] get_key_paths: Fix path searching with an easier algorithm
      commit: 4c2269fea9b40134837cce046e8f2281e863b844
[4/6] export-keyring: Continue updating keys that lost all their trust paths
      commit: 19dda191291ff897378f9924b5516318463d0ef8
[5/6] export-keyring: Default to store "clean" public keys
      commit: b088af1f40a56644d260ab9e18085a1b6b5ae31e
[6/6] make-sqlitedb: Don't consider SHA-1 signatures for trust paths
      commit: ece92eb6c5c33cf9981adad0b1c1b0f32621e189

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

