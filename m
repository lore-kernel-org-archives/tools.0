Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011A530BB80
	for <tools@linux.kernel.org>; Fri,  9 Oct 2026 07:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530982; cv=none; b=B4+GaWeTqLG791B/0sCFj12c7F4wvP4dSl18DPsbpOV2TUTdTQPO/zgLFp/3YoNt7WkmANtxwAVApRW5BF7gTmB7GSQzvqHy6LqZscVb+2bZ7fskZ3avj49nU2EokLlRYYT+LC8gC2Te+Sz4RzK6HDsZL9o/mvZGF28JFdKfaDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530982; c=relaxed/simple;
	bh=wozyMAUv+0w+zmC+DMZSoMCNlyCwKuKSlNqqLQcYmlI=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HxCKYfNw6/J6e6vB2PM/IMr6/UjFhTGAvwxznITfyyLUoDCe1rkgae8Hd7eQWY+5evul+p3Lbo3jHPXM7p99SdLHTYHEqmUN7AI1Sa4fCSoGugZ39waZzAusoLkrWByWghHp1Ubpa51vkOxyFv2Kd4yGaE0RXUxvb5WTYBKVWR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QVmyoPit; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QVmyoPit"
Received: by smtp.kernel.org (Postfix)
	id AC90E1F00898; Fri,  9 Oct 2026 07:29:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6914E1F000FF;
	Fri,  9 Oct 2026 07:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791530981;
	bh=NgkMORSA2nq2rITgBxILGLWogaYojPk515kXv0+mUG8=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=QVmyoPitaYDSbFUnkHrch1tBzr3Cwa6ilbWi4tbZNalsa4rQqpM+OEkhFCpSifDc/
	 bTjKCjUEGKtQ9W6DqB1EhyhHXMA81RPaLJrAI9r0PewGoMrvNGUutAip2Us/n7YYMF
	 vdHQfwmusw2F+WKdsHy4j5Mgnoaja6Es0uxpV2Fk=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260910-flowed-v1-1-f04419021beb@rsg.ci.i.u-tokyo.ac.jp>
References: <20260910-flowed-v1-1-f04419021beb@rsg.ci.i.u-tokyo.ac.jp>
Subject: Re: [PATCH b4] Normalize whitespace when unfolding wrapped
 trailers
Message-Id: <179153096968.3568561.7741760861916571163.b4-ty@b4>
Date: Fri, 09 Oct 2026 07:29:29 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=329;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=9NTqPeb482GOntMmwnTQykMfgotUoCqmvctozF3mzq8=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLJOTH98ScjnB4vNLbW3M952zTosXnfgXq65noGjN3/Vi
 v/P/0306ihlYRDjYpAVU2Qp2xe7KajwoYdceo8pzBxWJpAhDFycAjCRuTmMDLMC7bMqHp/hPP5d
 ZfpTzWNGE9e/eFGQW9h5j1dQWDDimRzD/5wnb2Yu+a52ot0/5cNSGW6VV25esWnfeiOt8hjy4k8
 v5AEA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Thu, 10 Sep 2026 02:24:03 +0900, Akihiko Odaki wrote:
> Normalize whitespace when unfolding wrapped trailers

Applied, thanks!

[1/1] Normalize whitespace when unfolding wrapped trailers
      commit: a75b3237ee57016adfc2af3123cc66d4816190c9

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

