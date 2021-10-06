private function funTrocaPosicoes():Void 
	{
		if (iRepet == 0) 
		{
			for (i in 0...iOrdemLenght)
			{
			aJanelas[i].filters = null;
			aJanelas[i].fixo = false;
			aJanelas[i].buttonMode = true;
			}
		}
		iRepet++;
		iSelecionado = funRandomRange(0, 11);
		iSelecionado2 = funRandomRange(0, 11); 
		if (iFase == 0) 
		{
			if (iSelecionado != iSelecionado2) 
			{
				if (aJanelas[iSelecionado].currentFrame == 1 && aJanelas[iSelecionado2].currentFrame != 1) 
				{
					aMonstrosFrames.push(aJanelas[iSelecionado2].currentFrame);
					aJanelas[iSelecionado].gotoAndStop(aMonstrosFrames[iContTrocas]);
					aJanelas[iSelecionado2].gotoAndStop(1);
					iContTrocas++;
				}else if (aJanelas[iSelecionado].currentFrame != 1 && aJanelas[iSelecionado2].currentFrame == 1) 
				{
					aMonstrosFrames.push(aJanelas[iSelecionado].currentFrame);
					aJanelas[iSelecionado].gotoAndStop(1);
					aJanelas[iSelecionado2].gotoAndStop(aMonstrosFrames[iContTrocas]);
					iContTrocas++;
				}
				else
				{
					funTrocaPosicoes();
				}
			}
			else
			{
				funTrocaPosicoes();
			}
		}
		else if (iSelecionado != iSelecionado2) 
		{
			if (aJanelas[iSelecionado].currentFrame != 1 && aJanelas[iSelecionado2].currentFrame != 1 && iContTrocas == 0)
			{
				aMonstrosFrames.push(aJanelas[iSelecionado].currentFrame);
				aMonstrosFrames.push(aJanelas[iSelecionado2].currentFrame);
				aJanelas[iSelecionado2].gotoAndStop(aMonstrosFrames[iContTrocas]);
				iContTrocas++;
				aJanelas[iSelecionado].gotoAndStop(aMonstrosFrames[iContTrocas]);
				iContTrocas++;	
			}
			else if (aJanelas[iSelecionado].currentFrame == 1 && aJanelas[iSelecionado2].currentFrame != 1 && aMonstrosFrames[iContTrocas - 1] != aJanelas[iSelecionado2].currentFrame) 
			{
				aMonstrosFrames.push(aJanelas[iSelecionado2].currentFrame);
				aJanelas[iSelecionado].gotoAndStop(aMonstrosFrames[iContTrocas]);
				aJanelas[iSelecionado2].gotoAndStop(1);
				iContTrocas++;
						
				if (iContTrocas < 2) 
				{
					funTrocaPosicoes();
				}
			}
			else if (aJanelas[iSelecionado].currentFrame != 1 && aJanelas[iSelecionado2].currentFrame == 1 && aMonstrosFrames[iContTrocas - 1] != aJanelas[iSelecionado].currentFrame) 
			{
				aMonstrosFrames.push(aJanelas[iSelecionado].currentFrame);
				aJanelas[iSelecionado].gotoAndStop(1);
				aJanelas[iSelecionado2].gotoAndStop(aMonstrosFrames[iContTrocas]);
				iContTrocas++;
						
				if (iContTrocas < 2) 
				{
					funTrocaPosicoes();
				}
			}
			else 
			{
				funTrocaPosicoes();
			}
		}
		else 
		{
			funTrocaPosicoes();
		}
	}
