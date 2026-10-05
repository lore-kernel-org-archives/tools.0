Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D133DDAF9
	for <tools@linux.kernel.org>; Mon,  5 Oct 2026 10:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791197171; cv=none; b=tOiRD88Qf6/Zdv3P6jqum453pxZeZCwCYyCMyiWsqddoc23eYokhG7d8esYX8wS9tMrekPuRuwrO4qioyiQbF4g100nIiZnCFCfdTg5dd6vN/7oxBiU0+Qe9lm15mGgFfE0mRUL5vBpbtRzd0OUbS/gmnb3j134skbK8nVgfFao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791197171; c=relaxed/simple;
	bh=VlaPAURTEogQ9rPfAYbL1//hy+yk3eIylspy36bolDQ=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tAWeplegx5ZrKuJ/iOjiy130yoINYyXGLGsBf9OYAQelMqcUl63shR39q7PD1TJfvSL1zxLfmwqgtk3WLM39GbMcPcQqVKVr8NDTcbuqijdpPMZHeaBEtdd0yQASDR7GvPXiyDFlv6zdQW24XMjUMwIRxhNmYny0TqsaZrs/mtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1swWd6Az; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1swWd6Az"
Received: by smtp.kernel.org (Postfix)
	id 8E0871F00893; Mon,  5 Oct 2026 10:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AF4F1F000FF;
	Mon,  5 Oct 2026 10:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791197170;
	bh=gTUx2BUtURSdNAwFJvZvx5M9fIaJW/ofSU3R3JMrb64=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=1swWd6AzqesnOUdWtNmC2iu/YL5ucDMGCySQ3Uv/wmd3Zt8y8MirEzopBbAnTmpGz
	 nxxq/n5C7tH+hibFCsg8JVrxhXTKjQsCkqzJ9r3pxooxQNTTJM5f6xuDf695kSppYZ
	 Z2UsOjtdkV1Wb6yvnf0jZ9zs9PrBOkzVMWLE7ivc=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Tamir Duberstein <tamird@kernel.org>
In-Reply-To: <20260918-stronger-type-checking-v2-0-37de1d8a6c86@kernel.org>
References: <20260918-stronger-type-checking-v2-0-37de1d8a6c86@kernel.org>
Subject: Re: [PATCH patatt v2 0/4] Harden local checks
Message-Id: <179119716448.1840287.14935807644552938018.b4-ty@b4>
Date: Mon, 05 Oct 2026 10:46:04 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=861;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=anWG1WfdtFCSOdpWwJ7yjUAg78crlxVrNulOddudFMs=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLIO13/IOLMiapK/4S3lFJ0YC8Us7+06vVWvi8KinLecz
 DDqM33dUcrCIMbFICumyFK2L3ZTUOFDD7n0HlOYOaxMIEMYuDgFYCLb7Bj+8KZ9KGZivvLpDHuG
 5KV9PdZ8mYEPpcLkf7QfvPf+yq4AY4b/ufZ7Bf8snqR7cnkD4/pYJcmkpfabOlKXP+BnUpsRyuL
 JCAA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Fri, 18 Sep 2026 15:02:51 -0400, Tamir Duberstein wrote:
> Harden local checks
> 
> The CI and checker setup proposed in v1 is now largely covered by
> 05c5bbb0b00e ("Add CI helper scripts and stricter type/lint gates").
> This revision builds on that work, retaining the remaining typing and
> cleanup changes and adding a lockfile for reproducible checks.
> 
> [...]

Applied, thanks!

[1/4] Track uv.lock for reproducible checks
      commit: 0e8f52eee99957e82c16c18473be7f309c84caee
[2/4] Tighten local type and lint checks
      commit: 5ba45852765821173e3740110f7562acab2ca8d7
[3/4] Reduce dictionary lookups
      commit: ca8a7d31413149e765cc81d72916d967ffeeb256
[4/4] Import PyNaCl unconditionally
      commit: 6624df4521b8a0cac7bca931594c4ab8f4e2e8e1

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

