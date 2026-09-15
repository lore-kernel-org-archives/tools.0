Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C4F4CCDF8
	for <tools@linux.kernel.org>; Tue, 15 Sep 2026 19:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499494; cv=none; b=U7aJ1SlRdASvwRnVviZNZYcIaXfbJj3zcDqDdHuhp8pFZHBxCm9WaVOD/6HLqWExrtT4xu7AYSHPytdT1ZpjcBxJTPYzxk39PtmRR6ArOF6EPilTRBeNcfyXyW9Qftcq8GHWbZN5qmkXCfBZsj0qx6x0iKs37E0zjup8uvnOpNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499494; c=relaxed/simple;
	bh=y/sJch5dowFGfhXpLlpDoOBCUdRSM+cd7TYRRWqWvmc=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RswAL56vpUrBJOUXur61a22QKAxHPFVMgGs9wcg9GoLhKM1U6TvPn3gWec/lCxoCc8g2anJfQbynKGUFN69+k/PWiwGQ0LmdBX0Fpy9jL/f6OHz7Ml+p09eM++oom1GzIpmAHy+34IFGUck2Pm6lv9iDfe8bu+QK3+sK8HPeDHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zuoawpVg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zuoawpVg"
Received: by smtp.kernel.org (Postfix)
	id D782B1F00893; Tue, 15 Sep 2026 19:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91D981F00898;
	Tue, 15 Sep 2026 19:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789499492;
	bh=lAq4nMNu0X03YaPoWuEB50cB4nCKnyoxGVf0EuIksEQ=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=zuoawpVgcCWSF/MTVUX2aQRdDOOiY0ELmArl94Sy7f8fYpt2MdGAkVqTRveS63us4
	 5k8IWRZTVbmmaTnqHa44AlfA0FjDE8nb2ZnUuZJfluo7MdUySFLMK3VKx+pVMojxmI
	 JPeqiDi4bb9bigQVWRIRFgACwXO1+pxyLaf2tcU8=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
In-Reply-To: <1789130860.8631fc262581453bbf619ec5b2062170.1a09082676a000c4f3@vates.tech>
References: <1789130860.8631fc262581453bbf619ec5b2062170.1a09082676a000c4f3@vates.tech>
Subject: Re: (subset) [b4 PATCH 0/3] config: fix stale defaults left by the
 liblore migration
Message-Id: <178949936562.12838.13729523467993364413.b4-ty@b4>
Date: Tue, 15 Sep 2026 19:09:25 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=ea86MBpef92flCOyGWA8Rk7f9aNnKm5/HPLUO0KaagA=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLJWzkjO1Xoh5xj7MT+5/hVn4ZdXu4uUZ804sW314k+LF
 25j21zv0FHKwiDGxSArpshSti92U1DhQw+59B5TmDmsTCBDGLg4BWAijpyMDD9/2tsxnVw+39fH
 I2P705hZ2o5RzwRZTxTw83bve9bOW8LIsE7eeONvn7sWZvPMNOuLN716fECpbX3+NdZrl9siVcu
 +cwAA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Fri, 11 Sep 2026 14:47:27 +0200, Baptiste Le Duc wrote:
> config: fix stale defaults left by the liblore migration
> 
> Since db4cd69 ("Migrate lore access to liblore library"), search queries
> are built by liblore from the server address in b4.midmask, and nothing
> reads b4.searchmask any more. Setting it has no effect, and b4 prints no
> warning to say so.

So, this isn't really a regression as much as it's, indeed, an 
architectural change that left the "searchmask" config dangling. I've 
added some plans to 0.17 to complete the migration, but some things need 
to land in liblore before I can work on that.

I've applied patches 2-3, but I wanted to make it more visible to users 
that "searchmask" is gone, so I reimplemented your patch 1 to give a 
warning when we find "searchmask" in the user's configs.

[2/3] docs: correct stale defaults in the configuration reference
      commit: 9140a2ca914811037e56b637176d87e441d01140
[3/3] config: take get_lore_node() fallbacks from DEFAULT_CONFIG
      commit: 6a92fefac9882e0da6a82a5f1109f423265fac3b

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

