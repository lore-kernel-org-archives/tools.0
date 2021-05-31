Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B379470
	for <tools@linux.kernel.org>; Mon, 31 May 2021 15:13:05 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1622473984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j2wieY6poRoi33S5SPICkQiI+cPLcnmybVwMKwVKMec=;
	b=Qph1YDSqWFyhV0NYgSQ7/87eT+JzPjE5RSECIQnvY1qApybJX9KVp5QcQH73AOEi+hM8wc
	7sEbTnv2OenPg6KGlKJ5m3j+p/TtoaWOzIJ7roVWZrtPyot7rtLPqkKV5pFYub/Sj7ZmlC
	6DA/W3l97xY4BC6Xw4cDUtTHEXILBBA=
From: Konstantin Ryabitsev <konstantin.ryabitsev@linux.dev>
To: Paul Barker <paul@pbarker.dev>,
	tools@linux.kernel.org
Cc: Konstantin Ryabitsev <konstantin.ryabitsev@linux.dev>
Subject: Re: [patatt][PATCH v2] Handle MIME encoded-word & other header manglings
Date: Mon, 31 May 2021 11:12:47 -0400
Message-Id: <162247394427.416221.8663625239721047804.b4-ty@linux.dev>
In-Reply-To: <20210531140539.7630-1-paul@pbarker.dev>
References: <20210531140539.7630-1-paul@pbarker.dev>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1064; h=from:subject:message-id; bh=uvZKJUYDcKP2RTgN06RdbjXFCHHIMZSagQ47PE3fFX4=; b=owGbwMvMwCG27YjM47CUmTmMp9WSGBK2/Hl+2qRykuLZa1zxCZt6V7ZwibgEPM8K3+3TbqL2xmqL O9vfjlIWBjEOBlkxRZayfbGbggofesil95jCzGFlAhnCwMUpABP5aMrwT59LuWjn6UuMlrv7ep7PWu LcuGLLrl+zjrzOWvt9+cQEnn8Mf0WStZ6HbC+UmXUq7fBSHefeefnnVNX1n/euezrRdy+PJC8A
X-Developer-Key: i=konstantin.ryabitsev@linux.dev; a=openpgp; fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: konstantin.ryabitsev@linux.dev

On Mon, 31 May 2021 15:05:39 +0100, Paul Barker wrote:
> When testing patatt with patches sent to a sr.ht hosted mailing list, it
> was found that long header lines (such as the X-Developer-Signature
> line) were re-encoded using the MIME encoded-word syntax (RFC 2047) when
> an mbox archive is generated, causing patatt to choke on the resulting
> text which looks like this:
> 
>     X-Developer-Signature: v=1; a=openpgp-sha256; l=672; h=from:subject;
>      bh=C40yOKgIfnNIUP+OW9WyPdBfljkZPpfUL1NepOODlx8=; =?utf-8?q?b=3DowGbwMvMwCF2?=
>      =?utf-8?q?w7xIXuiX9CvG02pJDAmb67lTNi0+IeF97TL76vtKD7xjSjaluz0o/KfmZLX8rMi7_?=
>      =?utf-8?q?l3M6O0pZGMQ4GGTFFFl2z951+fqDJVt7b0gHw8xhZQIZwsDFKQATydFhZJi+fFfvJ?=
>      =?utf-8?q?8+0MF7GrfzWnP?=
>      K7mAM/3n/r/UC+bprf6/g114QYGdbHcsaK7b1nanfA4IeZi1V0lL26cruXUWxgSEnNDP1FrAA=
> 
> [...]

Applied, thanks!

[1/1] Handle MIME encoded-word & other header manglings
      commit: 30840a6acae935ebc5332d08d61222cebe0b518b

Best regards,
-- 
Konstantin Ryabitsev <konstantin.ryabitsev@linux.dev>
