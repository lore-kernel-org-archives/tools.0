Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BD170
	for <tools@linux.kernel.org>; Mon, 31 May 2021 15:13:02 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1622473975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=93/ZXVwiTdoMqRKH6/hFzCVT6QUvHlbOc8xSdR2O2u4=;
	b=wXwM+N2MXuhqFDPbJc3HrbelfkBSKmH2IN6xXkH5yPLU32Xvd73k3ptTk/49A40vFDmCXm
	KhicIJcaE4MGqPqbCwplHXi1zH8M0r4xTwJ2KtaWE+XjA7G+QiUGjVHLNNLdpzLlJxW3Lr
	q1uH8f41+97ziLUfxgNXf0ixFg4HAXc=
From: Konstantin Ryabitsev <konstantin.ryabitsev@linux.dev>
To: Paul Barker <paul@pbarker.dev>,
	tools@linux.kernel.org
Cc: Konstantin Ryabitsev <konstantin.ryabitsev@linux.dev>
Subject: Re: [patatt][PATCH] Make instructions for automatic signing more reliable
Date: Mon, 31 May 2021 11:12:46 -0400
Message-Id: <162247394427.416221.3988513350302949062.b4-ty@linux.dev>
In-Reply-To: <20210530163623.926-1-paul@pbarker.dev>
References: <20210530163623.926-1-paul@pbarker.dev>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=658; h=from:subject:message-id; bh=YBxPUdC9b9GhV44l8zYkRNzbfS8iCuK8wAyXi/lW/AM=; b=owGbwMvMwCG27YjM47CUmTmMp9WSGBK2/HkW8+uZ74zbs+pPPVn9Tvioxp6PxQaTSzVE6yb+ZxYX z4k/2VHKwiDGwSArpshSti92U1DhQw+59B5TmDmsTCBDGLg4BWAifz8zMiy1mv245W+bx8b5yV80F/ KItij5b/52m/Gz1pbrhazBsVIM/3NV2382qNiyhId2z5386dicPXPYqoW+zFmy3un+udUdy3gB
X-Developer-Key: i=konstantin.ryabitsev@linux.dev; a=openpgp; fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: konstantin.ryabitsev@linux.dev

On Sun, 30 May 2021 17:36:23 +0100, Paul Barker wrote:
> We can't assume that the git directory path is '.git' from the root of
> the source tree. For example, this is not the correct path if patatt is
> checked out as a git submodule. We should use `git rev-parse --git-dir`
> to reliably determine the git directory path. We should also surround
> the path in quotes in case the user has cloned patatt in a path
> containing spaces.

Applied, thanks!

[1/1] Make instructions for automatic signing more reliable
      commit: 1fc7ed529fc07036072b79c040f083b1db1c668a

Best regards,
-- 
Konstantin Ryabitsev <konstantin.ryabitsev@linux.dev>
